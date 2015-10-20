# Resize ext4 partition after increasing the iscsi volume size

Steps:

- First increase the volume size of the ISCSI volume from storage side.
- login to linux client and do the following steps.

- Note: sdd is the disk shown in "fdisk -l" after iscsi lun discovery.
- Note: /mnt/demo is the mountpoint for sdd.
- Note: 10.1.10.71 is the VSM IP address (i.e. jail IP address)

- df -h
- mount
- umount /mnt/demo
- mount
- df -h
- fsck -r /dev/sdd
- fsck -a /dev/sdd
- iscsiadm -m node
- iscsiadm -m node -p 10.1.10.71:3260 -u
- iscsiadm -m node -p 10.1.10.71:3260 -l
- fdisk -l
- e2fsck -f /dev/sdd  // If you don't do this, resize2fs will prompt this step.
- resize2fs /dev/sdd
- mount -t ext4 -o noatime,nodiratime /dev/sdd /mnt/demo/
- df -h
- ls /mnt/demo
