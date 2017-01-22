# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, device/lge/mm1v/full_mm1v.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)


PRODUCT_NAME := cm_mm1v
BOARD_VENDOR := wileyfox
PRODUCT_DEVICE := mm1v

#don't know this not for sure
PRODUCT_GMS_CLIENTID_BASE := android-lge

PRODUCT_MANUFACTURER := LGE
PRODUCT_MODEL := LG-K350

PRODUCT_BRAND := lge
TARGET_VENDOR := lge
TARGET_VENDOR_PRODUCT_NAME := K350
TARGET_VENDOR_DEVICE_NAME := mm1v
