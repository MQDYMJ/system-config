#!/bin/bash

set -x
export PATH=/system-root/bin:/sbin:/system/bin:/system/xbin:/vendor/bin

rm -f /sbin/recovery || busybox rm -f /sbin/recovery
mkdir -p /system-2

mkdir -p /sc-root/dev/block /sc-root/proc /sc-root/sys
mount -t proc proc /sc-root/proc
slot=$(
    cd /sc-root/proc
    cat cmdline | grep suffix=_. -o |sed 's/.*=_//'
    )
umount /sc-root/proc

if test "$slot" != a -a "$slot" != b; then
    exit 0
fi

mount -t sysfs sysfs /sc-root/sys
uevent=$(
    cd /sc-root/sys/block/sda
    grep -l system_$slot $PWD/sda*/uevent
      )

if test ! -e "$uevent"; then
    umount /sc-root/sys
    exit 0
fi

major=$(
    cat $uevent | grep MAJOR= | sed -e 's/.*=//'
     )
minor=$(
    cat $uevent | grep MINOR= | sed -e 's/.*=//'
     )

umount /sc-root/sys
mkdir -p /sc-root/dev/block
mknod /sc-root/dev/block/system b $major $minor || exit

mount -t ext4 /sc-root/dev/block/system /system-2 -o ro,seclabel,relatime,data=ordered

if test -e /system-2/system; then
    (
        cd /system-2
        mv /sbin/adbd /sbin/adbd.bak
        do_not_copy_files="
            sepolicy
            plat_file_contexts
            plat_hwservice_contexts
            plat_property_contexts
            plat_seapp_contexts
            plat_service_contexts
        "
        do_not_copy() {
            local f
            for f in ${do_not_copy_files}; do
                if test "$1" = "$f"; then
                    return 0
                fi
            done
            return 1
        }

        for x in *; do
            if test "$x" = system; then
                continue
            elif test "$x" = init; then
                continue
            elif do_not_copy "$x"; then
                continue
            else
                cp "$x" / -av ||
                    if test -L "$x"; then
                        busybox rm -rf /"$x";
                        cp "$x" / -av
                    else
                        echo "$x" >> /root-failed-to-copy.txt
                    fi
            fi
        done
        mv /sbin/adbd.bak /sbin/adbd
        busybox rm -f /sepolicy
        mv /sepolicy.normal /sepolicy
    )
    if test -L /system; then
        busybox rm -f /system
        mkdir -p /system
    fi
    mount /system-2/system /system -o bind
    if test -e /system/etc/selinux/mapping/26.0.cil; then
        mount /system-root/etc/selinux/ /system/etc/selinux/ -o bind
    fi
    (
        cd /
        cat default.prop |
            if test -e /system-root/bin/update-prop.sed; then
                sed -f /system-root/bin/update-prop.sed
            else
                sed -e 's/ro.adb.secure=./ro.adb.secure=0/;s/persist.sys.usb.config=.*/persist.sys.usb.config=diag,serial_cdev,rmnet,adb/;'
            fi > default.prop.bak
        busybox rm -f default.prop
        mv default.prop.bak default.prop
        chmod 600 default.prop

        sed -e 's,service adbd /system/bin/adbd,service adbd /sbin/adbd,' -i init.usb.rc
        cp init.usb.rc init.usb.rc.bak
        chmod 666 init.usb.rc.bak
    )
fi

touch /hello-world
