$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/dlx/dlx-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/dlx/overlay

LOCAL_PATH := device/htc/dlx
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernAl
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/dlx/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/dlx/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/dlx/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/dlx/recovery/fstab.dlx:recovery/root/fstab.dlx

# For F2FS support (F2FS tools are needed)
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

#$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := htc_dlx
PRODUCT_BRAND := HTC
