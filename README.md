# pi-deploy
Deployment scripts for Raspberry Pi

Steps to creating a Raspberry Pi configured image.

1. Download image
   * `wget`
   * `unzip`
2. Burn image to SD card
   * `sudo dd bs=4M if=2017-09-07-raspbian-stretch-lite.img of=/dev/sdb conv=fsync`
3. Resize the root partition
   * `sudo parted /dev/sdb` (N.B. sdb)
     * `rm 2`
     * `mkpart primary ext4 40.2M 16GB`
     * `quit`
   * `sudo e2fsck -f /dev/sdb2` (N.B. sdb2)
   * `sudo resize2fs /dev/sdb2` (N.B. sdb2)
4. Setup SSH
   * ``
