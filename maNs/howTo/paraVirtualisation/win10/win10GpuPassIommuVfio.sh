#!/usr/bin/env bash

#DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-o4KPW5RzoK,guid=fd52e57a94579554427730bd61d16d2e
#DBUS_SESSION_BUS_PID=3559
#DBUS_SESSION_BUS_WINDOWID=44040193

VM_ID="10"
MACBASE="00:16:3e:ff:fe"
HDA="w10_C_70G.qcow2"
HDB="w10_J_69G.qcow2"

qemu-system-x86_64 -D err.log \
-uuid 8d635618-f622-45b3-83a1-b2050cbbcbc1 \
-global display.spice-app,gl=on \
-global display.egl-headless,gl=on \
-global display.vga=qxl \
-machine type=q35,accel=kvm,igd-passthru=on \
-cpu host,kvm=off,check \
-smp cores=8,sockets=2,threads=4 \
-m 16G \
-bios /storage/install/newest/qemu/build/pc-bios/bios-256k.bin \
-chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
-tpmdev emulator,id=tpm0,chardev=chrtpm \
-device tpm-tis,tpmdev=tpm0 \
-device ioh3420,bus=pcie.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root.1 \
-device vfio-pci,host=01:00.0,bus=root.1,addr=00.0,multifunction=on,x-vga=on,romfile=/storage/install/newest/rom/Asus.RTX3050Mobile.4096.210423.rom \
-device vfio-pci,host=01:00.1,bus=root.1,addr=00.1 \
-device intel-hda \
-boot "menu=on,order=d" \
-name "kvm_d_${VM_ID}" \
-drive "file=$HDA,index=0,media=disk,cache=writeback" \
-name "kvm_e_${VM_ID}" \
-drive "file=$HDB,index=1,media=disk,cache=writeback" \
-net "nic,model=virtio,macaddr=${MACBASE}:${VM_ID}" \
-net "tap,ifname=tap0,script=no,downscript=no" \
-device ivshmem-plain,memdev=ivshmem,bus=pcie.0 \
-object memory-backend-file,id=ivshmem,share=on,mem-path=/dev/shm/looking-glass,size=32M \
-device virtio-serial \
-chardev spicevmc,id=vdagent,name=vdagent \
-device virtserialport,chardev=vdagent,name=com.redhat.spice.0 \
-rtc clock=host,base=localtime \
-monitor stdio \

exit 0
