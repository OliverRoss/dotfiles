#!/bin/bash

MOUNT_PT='/mnt/raspberry_samba'
IP='192.168.188.22'

if [[ $1 == "mount" ]]; then
	sudo mount -t cifs //"$IP"/sambashare "$MOUNT_PT"
fi

if [[ $1 == "umount" ]]; then
	sudo umount $MOUNT_PT
fi

