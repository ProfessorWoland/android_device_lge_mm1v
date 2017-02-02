# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

VENDOR_BLOBS ?= vendor/lge/mm1v/mm1v-vendor.mk
$(call inherit-product-if-exists, $(VENDOR_BLOBS))

MTK_PROJECT_CONFIG ?= device/lge/mm1v/ProjectConfig.mk
include $(MTK_PROJECT_CONFIG)

# Charger and USB, probably need a change, i guess it's value from /sys/class/android_usb/android0/idVendor
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.usb.vid=1004

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/fstab.mm1v:root/fstab.mm1v

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    $(LOCAL_PATH)/configs/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
    $(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf \
    $(LOCAL_PATH)/configs/ht120.mtc:system/etc/.tp/.ht120.mtc

# System Properties
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    persist.sys.usb.config=mtp

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# This one is set by init
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := ro.product.model

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# GPS
PRODUCT_PACKAGES += \
    YGPS

# Telephony this is same in all k8's probably lg software do the job for dual sim
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0
PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds

PRODUCT_COPY_FILES += \
#dont have this    $(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml

# Graphics
MTK_GPU_VERSION := mali midgard r7p0

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.75

# Versioning
PRODUCT_PROPERTY_OVERRIDES += \
    ro.mediatek.version.release=$(MTK_BUILD_VERNO) \
    ro.mediatek.chip_ver=$(MTK_CHIP_VER)

# Inherit the rest from mt6735-common
$(call inherit-product, device/cyanogen/mt6735-common/mt6735.mk)
