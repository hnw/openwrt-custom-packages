# openwrt-custom-packages

This is my custom packages for OpenWrt, tested on CC(15.05.1).

To use these packages, add the following line to the feeds.conf in the OpenWrt buildroot:

```
src-git hnw https://github.com/hnw/openwrt-custom-packages.git
```
  
Then you can build packages as follows:

```
$ ./scripts/feeds update hnw
$ ./scripts/feeds install lv
$ make packages/lv/compile
```
