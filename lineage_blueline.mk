#
# Copyright (C) 2018-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# chipset flag enclose var with "" if more than one
# friendly tip: builders can use init_xxx.cpp as workaround for spacing
# e.g. property_override("ro.rising.chipset", "Snapdragon 870 5G");
RISING_CHIPSET := "sdm845"

# chipset flag enclose var with "" if more than one
# friendly tip: builders can use init_xxx.cpp as workaround for spacing
# e.g. property_override("ro.rising.maintainer", "maintainer");
RISING_MAINTAINER := "26.pluvieux"

# chipset flag enclose var with "" if more than one
# this will reflect on build/display version, a firmware package/zip name 
# e.g. risingDroid-7.0-COMMUNITY-device-AOSP.zip - AOSP is the default package type, WITH_GMS will override the package type to PIXEL
RISING_PACKAGE_TYPE := "GAPPS"

# Aperture Camera (default: not defined - skipped by the compiler)
TARGET_BUILD_APERTURE_CAMERA := false

# disable/enable blur support, default is false
TARGET_ENABLE_BLUR := true

# UDFPS ICONS/ANIMATIONS
TARGET_HAS_UDFPS := false

# Spoof build description/fingerprint as pixel device
TARGET_USE_PIXEL_FINGERPRINT := false

# add some stuff
TARGET_EXCLUDES_AUDIOFX := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_FACE_UNLOCK_SUPPORTED := false
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_BOOT_ANIMATION_RES := 1080
WITH_GMS := true

# Inherit device configuration
$(call inherit-product, device/google/crosshatch/aosp_blueline.mk)

include device/google/crosshatch/blueline/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3
PRODUCT_NAME := lineage_blueline

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=blueline \
    PRIVATE_BUILD_DESC="blueline-user 12 SP1A.210812.016.C2 8618562 release-keys"

BUILD_FINGERPRINT := google/blueline/blueline:12/SP1A.210812.016.C2/8618562:user/release-keys

$(call inherit-product, vendor/google/blueline/blueline-vendor.mk)

PRODUCT_PRODUCT_PROPERTIES += \
ro.control_privapp_permissions=log \
ro.adb.secure=0 \
persist.sys.usb.config=mtp,adb \
persist.service.debuggable=1 \
persist.service.adb.enable=1
