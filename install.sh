#!/bin/ash
clear
cd /tmp
# The latest version installed without dancing with a tambourine
ZAPRET_VERSION=v71.4
#For small linux version (OpenWRT)
curl -L -O https://github.com/bol-van/zapret/releases/download/$ZAPRET_VERSION/zapret-$ZAPRET_VERSION-openwrt-embedded.tar.gz
tar zxf zapret-$ZAPRET_VERSION-openwrt-embedded.tar.gz && rm zapret-$ZAPRET_VERSION-openwrt-embedded.tar.gz
cd zapret-$ZAPRET_VERSION
./install_easy.sh
cd ..
rm -R zapret-$ZAPRET_VERSION
cd /opt/zapret
sed -i '97G' config 
sed -i '97a --filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=5 --dpi-desync-fake-quic=/opt/zapret/files/fake/quic_initial_www_google_com.bin <HOSTLIST_NOAUTO> --new' config
sed -i '97a --filter-tcp=443 --dpi-desync=multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=5 --dpi-desync-fooling=badseq <HOSTLIST> --new' config
sed -i '97a --filter-tcp=80 --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=badsum <HOSTLIST> --new' config
/etc/init.d/zapret enable
/etc/init.d/zapret restart
echo "test youtube access by download a piece"
curl -4 -o /dev/null -k --connect-to ::speedtest.selectel.ru https://test.googlevideo.com/10MB -w %{speed_download}
curl --tls-max 1.2 -4 -o /dev/null -k --connect-to ::speedtest.selectel.ru https://test.googlevideo.com/10MB -w %{speed_download}
