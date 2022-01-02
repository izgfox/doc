#!/usr/bin/env bash

VM_ID="10"
MACBASE="00:16:3e:ff:ff"
HDA="w10_C_30G.qcow2"

#qemu-kvm -D err.log \
#qemu-system-x86_64 -D err.log \
#-L /storage/install/newest/qemu/qemu-6.1.0/build/pc-bios/ \
qemu-system-x86_64 -D err.log \
-machine q35,accel=kvm \
-enable-kvm \
-cpu host,kvm=off,check \
-smp cpus=2,sockets=1,cores=2,threads=1 \
-boot "menu=on,order=d" \
-m 16384M \
-name "kvm_${VM_ID}" \
-device intel-hda \
-drive "file=$HDA,index=0,media=disk,cache=writeback" \
-net "nic,model=virtio,macaddr=${MACBASE}:${VM_ID}" \
-net "tap,ifname=tap1,script=no,downscript=no" \
-vga none \
-device ioh3420,bus=pcie.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root \
-device vfio-pci,host=01:00.0,bus=root,addr=00.0,multifunction=on \
-device vfio-pci,host=01:00.1,bus=root,addr=00.1 \
-monitor stdio \
"$@"
-spice ipv6=off,port=5909,addr=0.0.0.0,disable-ticketing=on \
-device virtio-serial \
-chardev spicevmc,id=vdagent,name=vdagent \
-device virtserialport,chardev=vdagent,name=com.redhat.spice.0
