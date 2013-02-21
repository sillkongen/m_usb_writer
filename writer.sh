#!/bin/sh
# Write multiple USB keys repeatedly
# Oskar Agustsson 2013

# To turn off auto mounting of USB devices in Debian I created the following file in the folder /etc/udev/rules.d/ 85-no-automount.rules
# Just add the line below and nothing else, reboot is not needed
# ENV{UDISKS_AUTOMOUNT_HINT}="never"

# Create the amount of folders you want if you want to write to more than 2 devices just add to the for line the extra devices
for f in /mnt/usb1 /mnt/usb2 
do
# I can't be bothered with doing something smart here so I hide the error output since the directories are being recreated every time.
mkdir $f > /dev/null 2>& 1 & 
 # do something on $f
done

# Just add mount lines with the same amount of devices you will be using.
mount /dev/sdb1 /mnt/usb1
mount /dev/sdc1 /mnt/usb2

#Copy all pdf from run folder to the destination drives
cp *.pdf /mnt/usb1
cp *.pdf /mnt/usb2

echo "md5sum of original files"
md5sum *.pdf
echo "md5sum of destination files"
md5sum /mnt/usb1/*.pdf
md5sum /mnt/usb2/*.pdf

# Unmount the USB sticks
umount /mnt/usb1
umount /mnt/usb2
