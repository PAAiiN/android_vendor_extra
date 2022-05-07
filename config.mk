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

# Repainter integration
ifeq ($(WITH_REPAINTER_INTEGRATION),true)
PRODUCT_PACKAGES += \
    RepainterServicePriv

PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-custom
endif

# Safetynet Hax
ifeq ($(WITH_SAFETYNET_HAX),true)
PRODUCT_PACKAGES += \
    ih8sn

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/ih8sn.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf
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

# Google Stuff
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml \
    $(LOCAL_PATH)/prebuilt/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml

# OneHandedMode
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Privapp permissions whitelisting
PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log

# SIM
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.fflag.override.settings_provider_model=false

# System
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.binary_xml=false
