DEVICE_VARS += TPLINK_BOARD_ID

define Device/tplink-gzip
	DEVICE_VENDOR := TP-Link
	IMAGES += factory.bin
	IMAGE/factory.bin := append-rootfs | tplink-safeloader factory
	IMAGE/sysupgrade.bin := append-rootfs | tplink-safeloader sysupgrade | append-metadata
	KERNEL_SUFFIX := -uImage.itb
	KERNEL = kernel-bin | gzip | fit gzip $$(KDIR)/image-$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
	SOC := qcom-ipq4019
	TPLINK_BOARD_ID :=
endef

define Device/tplink_deco-m5
	$(call Device/tplink-gzip)
	DEVICE_MODEL := Deco-M5
	TPLINK_BOARD_ID := DECO-M5
	IMAGE_SIZE := 16640k
endef
TARGET_DEVICES += tplink_deco-m5

define Device/tplink_deco-m5-v2
	$(call Device/tplink-gzip)
	DEVICE_MODEL := Deco-M5
	DEVICE_VARIANT := v2
	TPLINK_BOARD_ID := DECO-M5
	IMAGE_SIZE := 16640k
endef
TARGET_DEVICES += tplink_deco-m5-v2