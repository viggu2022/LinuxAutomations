#!/bin/bash
declare -A disk_slot_available
DISKS=$(lsblk -e7 -e11 --scsi | grep -v ^loop)
for devices_disk in ${DISKS}
do
  disk_slot_available($devices_disk)
done

if ! [[-z  $disk_slot_available]];
then
  echo ${disk_slot_available}
fi

exit 0
