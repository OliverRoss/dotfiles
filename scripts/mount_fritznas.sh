#!/bin/bash

CRED="$HOME/.dotfiles/files/.smb_credentials"
MOUNT_PT='/mnt/fritz_nas'
IP='192.168.188.1'

if [[ $1 == "mount" ]]; then
	sudo mount -t cifs -o credentials=$CRED //"$IP"/FRITZ.NAS "$MOUNT_PT"
fi

if [[ $1 == "umount" ]]; then
	sudo umount $MOUNT_PT
fi

