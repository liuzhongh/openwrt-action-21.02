# 管理地址
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate
sed -i 's/Device\/tplink-8mlzma/Device\/tplink-16mlzma/g' target/linux/ar71xx/image/generic.mk

cat >> .config <<EOF
CONFIG_TARGET_ath79=y
CONFIG_TARGET_ath79_generic=y
CONFIG_TARGET_ath79_generic_DEVICE_mercury_mw4530r-v1=y
EOF
