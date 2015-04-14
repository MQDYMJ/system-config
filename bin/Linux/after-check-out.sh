#!/bin/bash

~/system-config/bin/after-co-ln-s.sh
. ~/system-config/.bashrc
touch ~/.where ~/.where.lock

if test $(whoami) = bhj; then
    sudo perl -npe 's/^XKBVARIANT=.*/XKBVARIANT="dvp"/;' -i /etc/default/keyboard
fi
sudo touch /etc/console-setup/* || true
sudo touch /etc/default/* || true # setupcon may fail when the timestamp of
                                  # these files are messed up by debian
                                  # installation (time zone or ntp not available
                                  # because we are not connected to the
                                  # Internet).
sudo setupcon
sudo usermod -a -G fuse $USER

sudo perl -npe 's/ main$/ main contrib non-free/' -i /etc/apt/sources.list

. ~/system-config/bin/Linux/download-external.sh
download_external >/dev/null 2>&1 &

set -e
export PATH=~/system-config/bin/Linux/config:~/system/bin/Linux:~/system/bin:$PATH

#update the system
upd_system

sudo usermod -a -G dialout $(whoami) || true
sudo perl -npe 's/^#user_allow_other/user_allow_other/' -i /etc/fuse.conf
mkdir -p ~/src/github
emacs-install-packages || true

if test ! -d /usr/local/share/info; then
    sudo mkdir -p /usr/local/share/info
fi

sudo ln -s ~/system-config/doc/bash.info.gz /usr/local/share/info/ -f

(
    cd /usr/local/share/info/
    sudo ginstall-info bash.info.gz /usr/local/share/info/dir
)

sudo postconf -e "home_mailbox = Maildir/$(whoami).localhost/"
sudo postconf -e "mailbox_command = "
sudo  /etc/init.d/postfix restart

(mozroots --import --sync&)
#编译一些软件
do_compile

echo 'Full config OK'
