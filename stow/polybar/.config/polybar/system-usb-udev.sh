#!/bin/sh

ICON_MOUNT=": ✓"
ICON_UNMOUNT=": ⚡"
COLOR_MOUNT="%{F#859900}"
COLOR_UNMOUNT="%{F#d33682}"

usb_print() {
    devices=$(lsblk -Jplno NAME,TYPE,RM,SIZE,MOUNTPOINT,VENDOR)
    output=""
    counter=0

    for unmounted in $(echo "$devices" | jq -r '.blockdevices[] | select(.type == "part") | select(.rm == true) | select(.mountpoint == null) | .name'); do
        unmounted=$(echo "$unmounted" | tr -d "[:digit:]")
        unmounted=$(echo "$devices" | jq -r '.blockdevices[] | select(.name == "'"$unmounted"'") | .vendor')
        unmounted=$(echo "$unmounted" | tr -d ' ')

        if [ $counter -eq 0 ]; then
            space=""
        else
            space="   "
        fi
        counter=$((counter + 1))

        output="${COLOR_UNMOUNT}$output$space $unmounted${ICON_UNMOUNT}"
    done

    for mounted in $(echo "$devices" | jq -r '.blockdevices[] | select(.type == "part") | select(.rm == true) | select(.mountpoint != null) | .size'); do
        if [ $counter -eq 0 ]; then
            space=""
        else
            space="   "
        fi
        counter=$((counter + 1))

        output="${COLOR_MOUNT}$output$space $mounted${ICON_MOUNT}"
    done

    echo "$output"
}

path_pid="/tmp/polybar-system-usb-udev.pid"

case "$1" in
    --mount)
        devices=$(lsblk -Jplno NAME,TYPE,RM,MOUNTPOINT)

        for mount in $(echo "$devices" | jq -r '.blockdevices[] | select(.type == "part") | select(.rm == true) | select(.mountpoint == null) | .name'); do
            udisksctl mount --no-user-interaction -b "$mount"

            # mountpoint=$(udisksctl mount --no-user-interaction -b $mount)
            # mountpoint=$(echo $mountpoint | cut -d " " -f 4- | tr -d ".")
            # terminal -e "bash -lc 'filemanager $mountpoint'"
        done

        ;;
    --unmount)
        devices=$(lsblk -Jplno NAME,TYPE,RM,MOUNTPOINT)

        for unmount in $(echo "$devices" | jq -r '.blockdevices[] | select(.type == "part") | select(.rm == true) | select(.mountpoint != null) | .name'); do
            udisksctl unmount --no-user-interaction -b "$unmount"
            udisksctl power-off --no-user-interaction -b "$unmount"
        done
        ;;
    *)
        echo $$ > $path_pid

        # trap exit INT
        # trap "echo" USR1

        # while true; do
            usb_print

        #     sleep 1 &
        #     wait
        # done
        ;;
esac
