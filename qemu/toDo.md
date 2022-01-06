### from unprivileged user
```
swtpm socket --tpmstate dir=/tmp/mytpm1   --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock   --log level=20
```
### or for tpm 2.0
```
swtpm socket --tpmstate dir=/tmp/mytpm1   --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock   --log level=20 --tpm2
```
### to /lib/modprobe.d
```
cp kvm_iommu.conf kvm.conf blacklist-nouveau.conf vfio.con /lib/modprobe.d
```
```
cp 99-kvm.rules /etc/udev/rules.d/
```
```
cp ./limits.conf /etc/security/limits.conf
```
```
cp profile /etc/profile
```
## paste this to /lib/modules/X.XX.XX/modules.dep
```
softdep nouveau pre: vfio-pci
softdep nvidia pre: vfio-pci
softdep nvidia* pre: vfio-pci
```
cp -r modprobe.d /etc/
