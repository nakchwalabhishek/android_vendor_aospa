#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

ifeq (aospa_fogos,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
#
# NOTE: fogos keeps a 32-bit secondary ABI (armeabi-v7a) because its stock
# Android 15 vendor blobs and several proprietary apps are 32-bit. We therefore
# inherit core_64_bit.mk (64-bit primary + 32-bit secondary) and NOT
# core_64_bit_only.mk, preserving 32-bit app/vendor compatibility.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the fogos device configuration.
$(call inherit-product, device/motorola/fogos/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

PRODUCT_NAME := aospa_fogos
PRODUCT_DEVICE := fogos
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g34 5G

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Boot animation resolution (720p panel)
TARGET_BOOT_ANIMATION_RES := 720

# Preserve the Motorola build fingerprint/description overrides so that
# Play Integrity / GMS and carrier provisioning keep working.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="fogos_g-user 15 V1UGS35H.75-14-3-8 4be56-0d815a release-keys MV-186" \
    BuildFingerprint=motorola/fogos_g/fogos:15/V1UGS35H.75-14-3-8/4be56-0d815a:user/release-keys \
    DeviceProduct=fogos_g

endif
