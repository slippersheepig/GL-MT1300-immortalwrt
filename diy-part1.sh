#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
rm -rf feeds/luci/applications/luci-app-passwall/
rm -rf feeds/packages/net/chinadns-ng/
rm -rf feeds/packages/net/dns2socks/
rm -rf feeds/packages/net/ipt2socks/
rm -rf feeds/packages/net/microsocks/
rm -rf feeds/packages/net/simple-obfs/
rm -rf feeds/packages/net/tcping/
rm -rf feeds/packages/net/xray-core/
rm -rf feeds/packages/net/xray-plugin/
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall package/luci-app-passwall
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/luci-app-passwall-packages
