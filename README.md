# pi-deploy
Deployment scripts for Raspberry Pi

Steps to creating a Raspberry Pi configured image.

1. Burn image to SD card
   * `wget`
   * TODO: Confirm the sha256sum of the download 
   * `unzip`
   * `sudo dd bs=4M if=2017-09-07-raspbian-stretch-lite.img of=/dev/sdb conv=fsync`
   * TODO: Combine the unzip and dd commands
2. TODO: Confirm the success of the dd command
3. Resize the root partition
   * DO NOT USE `parted` TO RESIZE. THIS COMMAND MAKES THE IMAGE UNBOOTABLE.
   * Resize Partition: https://access.redhat.com/articles/1190213
   * Expand File System: https://access.redhat.com/articles/1196353
   * `umount /dev/sdb1 /dev/sdb2`
   * `sudo fdisk /dev/sdb` (N.B. sdb, the device not a partition)
     * `p` 
     * `d 2`
     * `n primary 2 <start> <stop>`
     * `n primary 3 <start> <stop>`
     * `t 3 7`
     * `w`
   * `sudo e2fsck -f /dev/sdb2` (N.B. sdb2, the root partition)
   * `sudo resize2fs /dev/sdb2` (N.B. sdb2, the root partition)
   * `sudo mkfs.ntfs /dev/sdb3` (N.B. sdb3, the data partition)
4. Disable auto-expanding OS partition
   * From the /boot/cmdlines.txt file, remove `init=/usr/lib/raspi-config/init_resize.sh`
5. Setup SSH
   * `touch /run/media/<user>/boot/ssh` (N.B., the boot partition)
6. Download additional packages
   * `mkdir /run/media/<user>/<os partition>/opt/deb-installers`
   * `wget ntfs-3g.deb`
   * `cp ntfs-3g.deb /run/media/<user>/<os partition>/opt/deb-installers`
7. Secure default users
   * Change password
   * Exchange keys for ssh
8. Install additional packages
   * `deb -i ntfs-3g.deb`    #Install NTFS
   * `sudo mkdir /data       #Make 
   * `sudo mount -t ntfs /dev/mmcblk0p3`
9. Setup Wireless
   * Not required if using a wired Ethernet connection
   * ???
