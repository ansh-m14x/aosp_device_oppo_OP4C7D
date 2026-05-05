#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Health HAL Implementation
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir Configuration Rules (.rc and fstab)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6765:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6765 \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6765:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6765 \
    $(LOCAL_PATH)/rootdir/etc/factory_init.connectivity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/factory_init.connectivity.rc \
    $(LOCAL_PATH)/rootdir/etc/factory_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/factory_init.project.rc \
    $(LOCAL_PATH)/rootdir/etc/factory_init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/factory_init.rc \
    $(LOCAL_PATH)/rootdir/etc/init.aee.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.aee.rc \
    $(LOCAL_PATH)/rootdir/etc/init.ago.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.ago.rc \
    $(LOCAL_PATH)/rootdir/etc/init.connectivity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.connectivity.rc \
    $(LOCAL_PATH)/rootdir/etc/init.modem.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.modem.rc \
    $(LOCAL_PATH)/rootdir/etc/init.mt6765.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.mt6765.rc \
    $(LOCAL_PATH)/rootdir/etc/init.mt6765.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.mt6765.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/init.oppo.reserve.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.oppo.reserve.rc \
    $(LOCAL_PATH)/rootdir/etc/init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.project.rc \
    $(LOCAL_PATH)/rootdir/etc/init.sensor_1_0.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.sensor_1_0.rc \
    $(LOCAL_PATH)/rootdir/etc/meta_init.connectivity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/meta_init.connectivity.rc \
    $(LOCAL_PATH)/rootdir/etc/meta_init.modem.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/meta_init.modem.rc \
    $(LOCAL_PATH)/rootdir/etc/meta_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/meta_init.project.rc \
    $(LOCAL_PATH)/rootdir/etc/meta_init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/meta_init.rc \
    $(LOCAL_PATH)/rootdir/etc/multi_init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/multi_init.rc

# Custom Rootdir Script Shell Copies
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/engineer_vendor_shell.sh:$(TARGET_COPY_OUT_VENDOR)/bin/engineer_vendor_shell.sh \
    $(LOCAL_PATH)/rootdir/bin/init.oppo.face.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.oppo.face.sh \
    $(LOCAL_PATH)/rootdir/bin/init.oppo.face_calib.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.oppo.face_calib.sh \
    $(LOCAL_PATH)/rootdir/bin/init.oppo.fingerprints.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.oppo.fingerprints.sh

# Shipping API level (Android 9.0 Pie base)
PRODUCT_SHIPPING_API_LEVEL := 28

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/oppo/OP4C7D/OP4C7D-vendor.mk)
