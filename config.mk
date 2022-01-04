# Copyright (C) 2022 psionicprjkt
# SPDX-License-Identifier: Apache-2.0

# Build system
BUILD_BROKEN_DUP_RULES := true

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

# GrapheneOSCamera
ifeq ($(WITH_GOS),true)
PRODUCT_PACKAGES += \
    GrapheneOSCamera
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

ifeq ($(WITH_XRECORDER),true)
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
# XRecorder
PRODUCT_PACKAGES += \
    XRecorder
endif

ifeq ($(WITH_DOODLE),true)
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
# xyzDoodleLW
PRODUCT_PACKAGES += \
    xyzDoodleLW
endif

# END PREBUILT APK #
