PKGS="lv"
cd /home/openwrt/openwrt
rm -rf bin
cp feeds.conf.default feeds.conf
echo src-link custom /work >> feeds.conf
./scripts/feeds update -a
./scripts/feeds install $PKGS
for pkg in $PKGS; do
    make package/$pkg/compile V=s
done
find bin -name '*.ipk' -exec cp {} /work \;
tree -F /work/
