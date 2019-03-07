#include <QApplication>
#include <QPushButton>
#include <QFrame>
#include <string>
#include <QLineEdit>
#include <QTextEdit>
#include "adbstatethread.hpp"
#include <QtCore/QFile>
#include <QtCore/QDir>
#include <QtCore/QByteArray>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <QtCore/QProcessEnvironment>
#include <QtCore/QDebug>
#include <QStandardPaths>
#include <QtSingleApplication>
#include <QFileOpenEvent>

#ifdef Q_OS_WIN
#include <windows.h>
#endif

#include "fileopenfilter.h"
#include <QProcess>
#include "wrench.h"

#include "macros.h"
#include "wrenchmainwindow.h"
#include "vncmainwindow.h"
#include "qvncviewersettings.h"
#include "adbnotificationthread.hpp"

using namespace std;

#ifdef Q_OS_WIN32
void setenv(const char* name, const char* val, int overide)
{
    QString str;
    str.sprintf("%s=%s", name, val);
    _putenv(qPrintable(str));
}
#endif

QtVncViewerSettings *globalConfig = 0;
VncMainWindow *vncMainWindow = 0;

#ifdef Q_OS_WIN32
void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    QByteArray localMsg = msg.toLocal8Bit();
    switch (type) {
    case QtDebugMsg:
        fprintf(stderr, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtInfoMsg:
        fprintf(stderr, "Info: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtWarningMsg:
        fprintf(stderr, "Warning: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtCriticalMsg:
        fprintf(stderr, "Critical: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtFatalMsg:
        fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        abort();
    }
}
#endif

int main(int argc, char *argv[])
{
    QtSingleApplication a(argc, argv);
    if (a.isRunning()) {
        if (argc == 2) {
            a.sendMessage(argv[1]);
        } else {
            a.sendMessage("");
        }
        return 0;
    }
    a.setQuitOnLastWindowClosed(false);

#ifdef Q_OS_DARWIN
    FileOpenFilter fof(NULL);
    a.installEventFilter(&fof);
#endif

    globalConfig = new QtVncViewerSettings();
    globalConfig->setApplicationVersion(QVNCVIEWER_APP_VERSION);


#ifdef Q_OS_WIN32
    QString debug = QProcessEnvironment::systemEnvironment().value("WRENCH_DEBUG");
    if (debug == "true") {
        qInstallMessageHandler(myMessageOutput); // Install the handler
    } else {
        HWND hwnd = GetConsoleWindow();
        if (hwnd) {
            ShowWindow(hwnd, SW_HIDE);
        }
    }
#endif
    QString appDir = QCoreApplication::applicationDirPath();
    if (appDir.isEmpty()) { // happens on mac, =open Wrench.app=
        // google for "When OS X is set to use Japanese, a bug causes this sequence"
#ifndef Q_OS_WIN32
        char exe[PATH_MAX] = "";
        realpath(argv[0], exe);
        appDir = exe;
        appDir = appDir.left(appDir.lastIndexOf('/'));
#endif
    }
    qDebug() << "appDir is " << appDir;
    chdir(qPrintable(appDir));

    QString pathEnv = appDir;
#ifdef Q_OS_WIN32
    pathEnv += ";";
#else
    pathEnv += ":";
#endif
    pathEnv += QProcessEnvironment::systemEnvironment().value("PATH");

    setenv("PATH", qPrintable(pathEnv), 1);
    // FILE* fp = fopen("/Users/bhj/wrench.log", "w");
    // if (fp) {
    //     char cwd[1024];
    //     fprintf(fp, "cwd is %s, app is %s\n", getcwd(cwd, sizeof(cwd)), qPrintable(QCoreApplication::applicationDirPath()));
    //     if (QCoreApplication::applicationDirPath().isEmpty()) {
    //         fprintf(fp, "app path is ''\n");
    //     }
    //     fclose(fp);
    // }

#ifndef Q_OS_WIN32
    QString home = QProcessEnvironment::systemEnvironment().value("HOME");
    if (home.isEmpty()) {
        home = QDir::homePath();
        qDebug() << "home is " << home << " (from qt)";
        setenv("HOME", qPrintable(home), 1);
    }
#endif

    QString str = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
    gConfigDir = QDir(str);
    qDebug() << "config dir is " << gConfigDir;
    gConfigDir.mkpath("ext");

    gAppDir = QDir(appDir);

    str = QStandardPaths::writableLocation(QStandardPaths::CacheLocation);
    gDataDir = QDir(str);
    qDebug() << "data dir is " << gDataDir;
    gDataDir.mkpath(".");

    setenv("WRENCH_CONFIG_DIR", qPrintable(gConfigDir.absolutePath()), 1);
    setenv("WRENCH_DATA_DIR", qPrintable(gDataDir.absolutePath()), 1);
    setenv("WRENCH_APP_DIR", qPrintable(gAppDir.absolutePath()), 1);

    WrenchMainWindow w;
    a.setActivationWindow(&w, false);
    w.show();

    QObject::connect(&a, SIGNAL(messageReceived(const QString&)),
                     &w, SLOT(startTask(const QString&)));
    QObject::connect(&w, SIGNAL(activateWindow()),
                     &a, SLOT(activateWindow()));
    if (argc == 2) {
        w.startTask(argv[1]);
    }

    AdbStateThread adbState;
    adbState.moveToThread(&adbState);
    w.connect(&adbState, SIGNAL(adbStateUpdate(QString)), &w, SLOT(adbStateUpdated(QString)));
    w.connect(&adbState, SIGNAL(adbStateInfo(QString, QString)), &w, SLOT(onInfoUpdate(QString, QString)), Qt::BlockingQueuedConnection);
    adbState.start();

    AdbNotificationThread adbNotification;
    adbNotification.moveToThread(&adbNotification);
    adbNotification.start();
    w.connect(&adbNotification, SIGNAL(adbNotificationArrived(QString, QString, QString, QString, QString)), &w, SLOT(onAdbNotificationArrived(QString, QString, QString, QString, QString)));
    w.connect(&adbNotification, SIGNAL(adbNotificationState(QString)), &w, SLOT(adbStateUpdated(QString)));
    w.connect(&w, SIGNAL(adbNotificationClicked(QString)), &adbNotification, SLOT(onAdbNotificationClicked(QString)));

    QDir::addSearchPath("skin", ":/skin/default/resources");
    QDir::addSearchPath("config", ":config");
    QDir::addSearchPath("chatstyle", ":chatstyle/clear");

    QProcess::startDetached("./the-true-adb", QStringList("start-server"));

    int result = a.exec();

    globalConfig->deleteLater();
    adbNotification.quit();
    if (!adbNotification.wait(1000)) {
        qDebug() << "Failed to wait for adbNotification";
    }

    adbState.quit();
    if (!adbState.wait(1000)) {
        qDebug() << "Failed to wait for adbState";
    }
    return result;
}

QDir gConfigDir;
QDir gDataDir;
QDir gAppDir;
