#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

#!/bin/bash
# diy-part1.sh - 升级feeds和添加自定义源
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
./scripts/feeds update -a
# 适配N5105的内核优化
sed -i 's/CONFIG_KERNEL_PANIC_OOPS_PANIC=y/# CONFIG_KERNEL_PANIC_OOPS_PANIC is not set/' .config

# 添加 onliner 插件
git clone https://github.com/nhhqgirl/luci-app-onliner.git package/lean/luci-app-onliner

# 添加 PowerOff 插件
git clone https://github.com/nhhqgirl/luci-app-poweroff.git package/lean/luci-app-poweroff

# 添加主题
git clone --depth=1 https://github.com/nhyoungboy/luci-theme-opentomcat.git package/luci-theme-opentomcat

# git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
