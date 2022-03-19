# Copyright (C) 2022 psionicprjkt
# SPDX-License-Identifier: Apache-2.0

# Build system
BUILD_BROKEN_DUP_RULES := true

PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Charger
ifeq ($(WITH_PIXEL_CHARGER),true)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)
endif

# START PREBUILT APK #

# CameraGO
ifeq ($(WITH_GCAMGO),true)
PRODUCT_PACKAGES += \
    CameraGO
endif

# CameraGOMod
ifeq ($(WITH_GCAMGO_MOD),true)
PRODUCT_PACKAGES += \
    CameraGOMod
endif

# OpenCamera
ifeq ($(WITH_OPENCAMERA),true)
PRODUCT_PACKAGES += \
    OpenCamera
endif

# PowerMenuControls
ifeq ($(WITH_PMC),true)
PRODUCT_PACKAGES += \
    PowerMenuControls
endif

# END PREBUILT APK #

# Google Photos
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml

# Privapp permissions whitelisting
PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log
