```
qemu-img create -f qcow2  -o backing_file=modified.img,backing_fmt=raw  diff.qcow2
...
qemu-img resize w10_C_70G.qcow2 --preallocation=off --shrink 70G
``
