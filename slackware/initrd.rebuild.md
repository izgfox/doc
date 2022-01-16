```
[root@darkstar.example.net boot]# mv /mnt/hd/EFI/Slackware/initrd.gz /mnt/hd/EFI/Slackware/initrd.gz.bak
[root@darkstar.example.net boot]# cp ./initrd.gz /mnt/hd/EFI/Slackware/
[root@darkstar.example.net boot]# qemu-img info /mnt/hd/EFI/Slackware/initrd.gz
image: /mnt/hd/EFI/Slackware/initrd.gz
file format: raw
virtual size: 9.61 MiB (10075648 bytes)
disk size: 9.61 MiB
[root@darkstar.example.net boot]# file /mnt/hd/EFI/Slackware/initrd.gz
/mnt/hd/EFI/Slackware/initrd.gz: gzip compressed data, max compression, from Unix, original size modulo 2^32 29218304

```
