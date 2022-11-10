#########################################################################
# File Name: fix.sh
# Author: Carbon (ecrasy@gmail.com)
# Description: feel free to use
# Created Time: 2022-07-30 04:57:44 UTC
# Modified Time: 2022-11-10 04:51:12 UTC
#########################################################################


#!/bin/bash

# fixing cjdns compile error
# sed -i 's/ -Wno-error=stringop-overflow//g' package/feeds/routing/cjdns/Makefile
# sed -i 's/ -Wno-error=stringop-overread//g' package/feeds/routing/cjdns/Makefile
# echo "Fixing cjdns makefile error!!!"

# fixing e2guardian compile error
# sed -i 's/-fno-rtti/-fno-rtti -std=c++14/g' package/network/services/e2guardian/Makefile
# echo "Fixing e2guardian compile error!!!"

# fixing lua-eco recursive depend error
# sed -i 's/ +PACKAGE_libwolfssl:libwolfssl//g' feeds/packages/lang/lua-eco/Makefile
# echo "Fixing lua-eco config error!!!"

# fixing qtbase package hash
# sed -i '/official_releases/d' package/feeds/packages/qtbase/Makefile
# echo "Fixing qtbase hash error!!!"

# fixing error from https://github.com/openwrt/luci/issues/5373
# luci-app-statistics: misconfiguration shipped pointing to non-existent directory
str="^[^#]*option Include '/etc/collectd/conf.d'"
cmd="s@$str@#&@"
sed -ri "$cmd" feeds/luci/applications/luci-app-statistics/root/etc/config/luci_statistics
echo "Fix luci-app-statistics ref wrong path error"

# fixing stupid coremark bench file error
touch package/base-files/files/etc/bench.log
chmod 0666 package/base-files/files/etc/bench.log
echo "Touch coremark log file to fix uhttpd error!!!"

# fixing dnsmasq compile error
# from: https://github.com/openwrt/openwrt/issues/9043
# cp $GITHUB_WORKSPACE/data/patches/dnsmasq-struct-daemon.patch package/network/services/dnsmasq/patches/
# echo "Fix dnsmasq issue 9043"

# make minidlna depends on libffmpeg-full instead of libffmpeg
# little bro ffmpeg mini custom be gone
sed -i "s/libffmpeg /libffmpeg-full /g" feeds/packages/multimedia/minidlna/Makefile
echo "Make minidlna depends on libffmpeg-full instead of libffmpeg"

# make cshark depends on libustream-openssl instead of libustream-mbedtls
# i fucking hate stupid mbedtls so much, be gone
sed -i "s/libustream-mbedtls/libustream-openssl/g" feeds/packages/net/cshark/Makefile
echo "Make cshark depends on libustream-openssl instead of libustream-mbedtls"

echo -e "FIX Completed!!!\n"

