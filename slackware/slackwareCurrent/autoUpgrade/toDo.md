## Generate local mirror for slackware current
### Get script and prepare directory for mirror
```
wget http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
chmod +x mirror-slackware-current.sh
mkdir -pv slackware64-current
```
### Run rsync with -m option that set nearest mirror 
**Example set russian rsync mirror from  https://mirrors.slackware.com/mirrorlist/**
```
ARCH=x86_64 \
./mirror-slackware-current.sh \
-l . \
-X none \
-m slackware.tsu.ru::slackware/slackware64-current \
-o NONE
```
### Make install iso image from current
**Chech disk space on /tmp before**
```
cd slackware64-current
xorriso -as mkisofs \
  -iso-level 3 \
  -full-iso9660-filenames \
  -R -J -A "Slackware Install" \
  -hide-rr-moved \
  -v -d -N \
  -eltorito-boot isolinux/isolinux.bin \
  -eltorito-catalog isolinux/boot.cat \
  -no-emul-boot -boot-load-size 4 -boot-info-table \
  -isohybrid-mbr /usr/share/syslinux/isohdpfx.bin \
  -eltorito-alt-boot \
  -e isolinux/efiboot.img \
  -no-emul-boot -isohybrid-gpt-basdat \
  -m 'source' \
  -volid "SlackDVD" \
  -output /tmp/slackwareCurrent/slackware64-current.iso \
  .
```
### Write image to disk
```
dd if=/tmp/slackware64-current.iso of=/dev/sda bs=1M status=progress
```
### backup
```
cd /boot
cp ./initrd-tree/ ./initrd-tree.bak
```
### think about output initrd file and :
```
mkinitrd -k 5.15.12 -u -f ext4 -s ./initrd-tree/ -r /dev/nvme0n1p2 -o ./initrd.gz
```