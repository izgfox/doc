## meson
#
```
meson setup builddir
meson compile -C builddir
meson install -C builddir
```

## qemu
#
## configure
```
cd build && ../configure --enable-spice --enable-spice-protocol --target-list=x86_64-softmmu
```
