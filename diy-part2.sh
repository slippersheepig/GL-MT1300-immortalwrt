#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i '1iPKG_USE_MIPS16:=0' package/luci-app-passwall-packages/sing-box/Makefile
echo "================================================="
echo "==> Handling microsocks broken patch"
echo "================================================="

MICROSOCKS_PATCH_DIR="package/luci-app-passwall-packages/microsocks/patches"
BROKEN_PATCH="100-Add-SOCKS5-forwarding-rules-support.patch"

if [ -d "$MICROSOCKS_PATCH_DIR" ]; then
  echo "[INFO] microsocks patch directory exists:"
  ls -l "$MICROSOCKS_PATCH_DIR"

  if [ -f "$MICROSOCKS_PATCH_DIR/$BROKEN_PATCH" ]; then
    echo "[INFO] Found broken patch: $BROKEN_PATCH"
    echo "[INFO] Removing it now..."
    rm -f "$MICROSOCKS_PATCH_DIR/$BROKEN_PATCH"

    echo "[INFO] After removal, remaining patches:"
    ls -l "$MICROSOCKS_PATCH_DIR"
  else
    echo "[INFO] Broken patch NOT found, nothing to remove."
  fi
else
  echo "[WARN] microsocks patch directory does not exist!"
fi

echo "================================================="
