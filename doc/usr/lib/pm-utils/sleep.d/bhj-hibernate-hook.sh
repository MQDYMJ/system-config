#!/usr/bin/env bash

case $1 in
    hibernate)
        ;;
    suspend)
        ;;
    thaw)
        ;;
    resume|post)
        (
            su - bhj -c "
                         set -x
                         sleep 1 && bash -x ~bhj/system-config/bin/switch-touchpad &
                         sleep 1 && re-xmodmap&
                         . ~/system-config/bin/set-ssh-agent
                         sleep 30 && notify-real-home&
            " >~bhj/.cache/system-config/logs/bhj-hibernate-hook.sh.log 2>&1
            echo done "$@"
            echo
        ) > ~bhj/.cache/system-config/logs/$(basename $0).log 2>&1
        ;;
    pre)
        (
            cmd=$(cat <<'EOF'
set -x
. ~/.renew-xauth
. ~/.config/system-config/.bashrc-path
xscreensaver-command -lock&
EOF
            )

            su - bhj -c "$cmd"
        ) > ~bhj/.cache/system-config/logs/$(basename $0).log2 2>&1
        ;;
    *)  echo "ERROR: called incorrectly."
        ;;
esac
