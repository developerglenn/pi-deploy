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
   * `sudo parted /dev/sdb` (N.B. sdb, the device not a partition)
     * `rm 2`
     * `mkpart primary ext4 40.2M 16GB`
     * `mkpart primary ntfs 16.0GB 128GB`
     * `quit`
   * `sudo e2fsck -f /dev/sdb2` (N.B. sdb2, the root partition)
   * `sudo resize2fs /dev/sdb2` (N.B. sdb2, the root partition)
   * `sudo mkfs.ntfs /dev/sdb3` (N.B. sdb3, the data partition)
4. Setup SSH
   * `touch /run/media/<user>/boot/ssh` (N.B., the boot partition)
