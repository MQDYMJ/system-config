#!/bin/bash
ps-killall xscreensaver.-no-splash
. atexit bash -c 'cd ~/tmp/; nohup setsid xscreensaver -no-splash >/dev/null 2>&1 &'
/usr/bin/mplayer "$@"
