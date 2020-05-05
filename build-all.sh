#!/usr/bin/env bash
set -e

function die() {
    echo Error: "$@"
    exit -1
}

cd $(dirname $(readlink -f $0))
export DOING_WRENCH_RELEASE=true

## start code-generator "^\\s *#\\s *"
# generate-getopt ssmb r:ReleaseVersion p:platforms=all
## end code-generator
## start generated code
TEMP=$(getopt -o sr:p:h \
              --long smb,ReleaseVersion:,platforms:,help,no-smb \
              -n $(basename -- $0) -- "$@")
smb=false
ReleaseVersion=
platforms=all
eval set -- "$TEMP"
while true; do
    case "$1" in

        -s|--smb|--no-smb)
            if test "$1" = --no-smb; then
                smb=false
            else
                smb=true
            fi
            shift
            ;;
        -r|--ReleaseVersion)
            ReleaseVersion=$2
            shift 2
            ;;
        -p|--platforms)
            platforms=$2
            shift 2
            ;;
        -h|--help)
            set +x
            echo
            echo
            echo Options and arguments:
            printf %6s '-p, '
            printf %-24s '--platforms=PLATFORMS'
            echo
            printf %6s '-r, '
            printf %-24s '--ReleaseVersion=RELEASEVERSION'
            echo
            printf %6s '-s, '
            printf %-24s '--[no-]smb'
            echo
            exit
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            die "internal error: $(. bt; echo; bt | indent-stdin)"
            ;;
    esac
done


## end generated code
export ReleaseVersion
export shortVersion=$ReleaseVersion

ReleaseVersion="$shortVersion $@"
if test ! "$shortVersion"; then
    die "No shortVersion defined"
fi

. .gitx

if git st -s | grep . -q; then
    git st -s
    die "Can't do release build when git not clean: see output above"
fi

atexit() {
    cd ~/src/github/Wrench
    git checkout -- .
}
trap atexit 0

export Wrench_GIT_HASH=$(git log --pretty=%h -1 HEAD)
if git log --pretty=%s -1 | grep -P 'Release for \Q'"$ReleaseVersion"'\E' -q; then
    echo "Already released"
    true
else
    oldVersion=$(perl -ne 'print $1 if m!<string>Wrench\s*(V.*)</string>!' wrenchmainwindow.ui)
    perl -npe 's!<string>Wrench\s*V.*</string>!<string>Wrench $ENV{shortVersion} ($ENV{Wrench_GIT_HASH})</string>!' -i wrenchmainwindow.ui

    git commit -m "Release for $ReleaseVersion $Wrench_GIT_HASH" -a

    if test $(compare-version "$oldVersion" "$shortVersion") != '<'; then
        if test $(compare-version "$oldVersion" "$shortVersion") = "=" &&
                yes-or-no-p -n "Use the same version $shortVersion ($Wrench_GIT_HASH) = $oldVersion?"; then
            true
        else
            die "old version $oldVersion >= new version $shortVersion"
        fi
    fi
fi

git clean -xfd
git submodule foreach 'git clean -xfd'

function is-platform-needed() {
    test "$platforms" = all -o -z "$(arg1-arg2 "$1" "$platforms")"
}

if is-platform-needed wine; then
    (
        rm ~/tmp/build-wrench-windows -rf
        ./build-wine.sh
        touch ~/tmp/build-wrench-windows/build-ok
    )&
fi

if is-platform-needed ubuntu; then
    if ! timeout 5 ssh trusty true; then
        echo need cowbuild-chroot first
        cowbuild-chroot
    fi || true
    (
        if echo $SHELLOPTS | grep -q xtrace; then
            bashx=-x
        else
            bashx=
        fi

        ssh-quote trusty "
            mkdir -p ~/tmp/build-wrench
            chmod u+w ~/tmp/build-wrench/ -R
            rm ~/tmp/build-wrench/ -rf
            . ~/.profile;
            export DOING_WRENCH_RELEASE=true;
            PATH=~/external/local/qt5-ubuntu-1404/bin/:\$PATH;
            cd $PWD;
            bash $bashx ./build-linux.sh -r Wrench-ubuntu-14.04
        "
        touch ~/external/cowbuilder/ubuntu-trusty-amd64/chroot/home/bhj/tmp/build-wrench/build-ok
    )&
fi

if is-platform-needed debian; then
    (
        chmod u+w ~/tmp/build-wrench/ -R
        rm ~/tmp/build-wrench -rf
        ./build-linux.sh -b ~/tmp/build-wrench
        touch ~/tmp/build-wrench/build-ok
    )&
fi

if is-platform-needed mac; then
    (

        ssh bhj-mac rm $(up) -rf
        rm ~/tmp/build-wrench-mac -rf
        mkdir ~/tmp/build-wrench-mac -p
        ./build-mac.sh
        touch ~/tmp/build-wrench-mac/build-ok
    )&
fi

wait

if is-platform-needed wine && test ! -e ~/tmp/build-wrench-windows/build-ok; then
    die "Windows build failed"
fi

if is-platform-needed ubuntu && test ! -e ~/external/cowbuilder/ubuntu-trusty-amd64/chroot/home/bhj/tmp/build-wrench/build-ok; then
    die "ubuntu build failed"
fi

if is-platform-needed debian && test ! -e ~/tmp/build-wrench/build-ok; then
    die "Linux build failed"
fi

if is-platform-needed mac &&  test ! -e ~/tmp/build-wrench-mac/build-ok; then
    die "Mac build failed"
fi

for x in $(
              is-platform-needed debian && echo ~/src/github/Wrench-debian;
              is-platform-needed mac && echo ~/src/github/Wrench-macos/Wrench.app/Contents/MacOS/;
              is-platform-needed wine && echo ~/src/github/Wrench-windows;
              is-platform-needed ubuntu && echo ~/src/github/Wrench-ubuntu-14.04;
          ); do
    (
        cd $x
        if test -e last-pic-notes.png; then
            rm -f last-pic-notes.png
        fi
        # ./update-md5s.sh
        lookup-file -e .git
        cd $(dirname $(lookup-file -e .git))
        git add .
        git commit -m "Release for $ReleaseVersion ($Wrench_GIT_HASH)"
        git-mark-need-merge
        git push&
        dir=$(basename $PWD)
        cd ..

        file=~/tmp/$dir.zip
        if test "$dir" = Wrench-debian -o "$dir" = Wrench-ubuntu-14.04; then
            file=~/tmp/$dir.tgz
            tar czfv $file $dir --exclude-vcs
        else
            rm -f $file
            zip -r $file $dir -x '*/.git/*'
        fi
        if test $smb = true; then
            bfile=$(basename $file)
            (
                cd ~/smb/share.smartisan.cn/share/baohaojun/Wrench
                mkdir -p old-versions
                mv ${bfile%.*}* old-versions || true
            )
            smb-push $file ~/smb/share.smartisan.cn/share/baohaojun/Wrench/${bfile%.*}-$shortVersion.${bfile##*.}
        fi || true&
    )
done


echo all done
