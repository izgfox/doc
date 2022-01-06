#!/usr/bin/env bash

VM_ID="01"

MACBASE="00:16:3e:ff:ff"

HDA="theOne.qcow2"
HDB="slackware64-14.2-install-dvd.iso"

qemu-kvm \
-L /storage/install/qemu/qemu-6.1.0/build/pc-bios/ \
-enable-kvm \
-cpu host \
-smp cores=4 \
-boot "menu=on,order=d" \
-m 4096M \
-name "kvm_${VM_ID}" \
-cdrom "$HDB" \
-drive "file=$HDA,index=0,media=disk,cache=writeback" \
-net "nic,model=virtio,macaddr=${MACBASE}:${VM_ID}" \
-net "tap,ifname=tap2,script=no,downscript=no" \
-device intel-hda \
-vga qxl \
-spice ipv6=off,port=666,addr=0.0.0.0,disable-ticketing=on \
-device virtio-serial \
-chardev spicevmc,id=vdagent,name=vdagent \
-device virtserialport,chardev=vdagent,name=com.redhat.spice.0
