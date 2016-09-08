PKGS="lv"
ARCH=$1
PACKAGE_DIR=$2
FEED_NAME=custom
cd /home/openwrt/sdk
rm -rf bin
cp feeds.conf.default feeds.conf
echo src-link $FEED_NAME /work >> feeds.conf
./scripts/feeds update -a
./scripts/feeds install $PKGS
make defconfig
for pkg in $PKGS; do
    make package/$pkg/compile V=s
done
ls -laR bin
cd $PACKAGE_DIR/$FEED_NAME
for file in *; do
    mv $file ${ARCH}-${file}
done
cp ./${ARCH}-* /work
ls -la /work
