#!/bin/bash

if [[ $1 == "mount" ]]
then
	sudo cryptsetup luksOpen /dev/sdb3 cryptssd 
	sudo lvm vgchange vgxubuntu -a y
	sudo mount /dev/vgxubuntu/root /mnt/ssd
fi 

if [[ $1 == "unmount" ]]
then
	sudo umount /mnt/ssd
	sudo lvm vgchange vgxubuntu -a n
	sudo cryptsetup luksClose cryptssd
fi 
