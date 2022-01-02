#!/usr/bin/env bash

VM_ID="10"
MACBASE="00:16:3e:ff:ff"
HDA="w10_C_30G.qcow2"

#qemu-kvm -D err.log \
#qemu-system-x86_64 -D err.log \
#-L /storage/install/newest/qemu/qemu-6.1.0/build/pc-bios/ \
qemu-system-x86_64 -D err.log \
-enable-kvm \
-cpu host \
-smp cores=4 \
-boot "menu=on,order=d" \
-m 16384M \
-name "kvm_${VM_ID}" \
-drive "file=$HDA,index=0,media=disk,cache=writeback" \
-net "nic,model=virtio,macaddr=${MACBASE}:${VM_ID}" \
-net "tap,ifname=tap1,script=no,downscript=no" \
-device intel-hda \
-vga qxl \
-spice ipv6=off,port=5909,addr=0.0.0.0,disable-ticketing=on \
-device virtio-serial \
-chardev spicevmc,id=vdagent,name=vdagent \
-device virtserialport,chardev=vdagent,name=com.redhat.spice.0
