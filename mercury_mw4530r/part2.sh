# 管理地址
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i '/<footer>/a <a href=\"https:\/\/github.com\/liuzhongh\/Actions-OpenWrt">Build by Liuzhongh<\/a>' feeds/luci/themes/luci-theme-bootstrap/luasrc/view/themes/bootstrap/footer.htm

# 固件架构
cat >> .config <<EOF
CONFIG_TARGET_ath79=y
CONFIG_TARGET_ath79_generic=y
CONFIG_TARGET_ath79_generic_DEVICE_mercury_mw4530r-v1=y
EOF

# IPV6
cat >> .config <<EOF
CONFIG_IPV6=y
CONFIG_PACKAGE_ip6tables=y
CONFIG_PACKAGE_iptables-mod-extra=y
CONFIG_PACKAGE_iptables-mod-nat-extra=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_odhcp6c_ext_cer_id=0
CONFIG_PACKAGE_odhcpd-ipv6only=y
CONFIG_PACKAGE_odhcpd_ipv6only_ext_cer_id=0
EOF

# 取消默认启用的包
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-ddns is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_PACKAGE_luci-app-arpbind is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-wol is not set
# CONFIG_PACKAGE_luci-app-ramfree is not set
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-cpufreq is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
# CONFIG_PACKAGE_v2ray is not set
# CONFIG_PACKAGE_shadowsocks-libev-ss-redir is not set
# CONFIG_PACKAGE_shadowsocksr-libev-server is not set
# CONFIG_PACKAGE_ddns-scripts_aliyun is not set
# CONFIG_PACKAGE_ddns-scripts_dnspod is not set
EOF

# 其它默认的包 luci luci-app-upnp luci-app-nlbwmon luci-app-samba autosamba automount default-settings

# 基本软件:
cat >> .config <<EOF
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-ipkg=y
EOF

# Kernel build options
cat >> .config <<EOF
CONFIG_KERNEL_BUILD_DOMAIN="liuzhongh@github"
CONFIG_KERNEL_BUILD_USER="liuzhongh"
EOF

# FFmpeg
cat >> .config <<EOF
CONFIG_PACKAGE_libopus=y
CONFIG_PACKAGE_libx264=y
CONFIG_PACKAGE_ffmpeg=y
CONFIG_PACKAGE_ffprobe=y
EOF

# 常用软件 默认已启用
#cat >> .config <<EOF
#CONFIG_PACKAGE_luci=y
#CONFIG_PACKAGE_luci-app-upnp=y
#CONFIG_PACKAGE_luci-app-nlbwmon=y
#CONFIG_PACKAGE_luci-app-samba=y
#CONFIG_PACKAGE_autosamba=y
#CONFIG_PACKAGE_default-settings=y
#EOF

cat >> .config <<EOF
CONFIG_PACKAGE_AdGuardHome=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-adbyby-plus=y
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-ramfree=y
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-ddns=y
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-vsftpd=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-arpbind=y
CONFIG_PACKAGE_luci-app-wol=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-accesscontrol=y
CONFIG_PACKAGE_luci-app-cpufreq=y
CONFIG_PACKAGE_v2ray=y
CONFIG_PACKAGE_ddns-scripts_dnspod=y
CONFIG_PACKAGE_luci-app-guest-wifi=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_default-settings=y
EOF

#
# 4. Themes
#
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-argon=y
EOF

#
# 多拨负载均衡
#
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-mwan3helper=y
EOF
# 其它
# sed -i '21d' package/lean/default-settings/files/zzz-default-settings #禁止网络共享分类到NAS
