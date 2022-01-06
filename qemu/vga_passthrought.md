```
  416  modprobe vfio
  417  modprobe vfio_iommu_type1
  418  modprobe vfio_pci
  419  modprobe vfio_virqfd
  421  echo "10de 25a5" > /sys/bus/pci/drivers/vfio-pci/new_id
  423  echo "0000:01:00.0" > /sys/bus/pci/drivers/vfio-pci/bind
  424  echo "10de 2291" > /sys/bus/pci/drivers/vfio-pci/new_id
  426  echo "0000:01:00.1" > /sys/bus/pci/drivers/vfio-pci/bind

```
