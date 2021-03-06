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


# Inherit for devices that support 64-bit primary and 32-bit secondary zygote startup script
#probably don't support? remove in case of bug
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from porridge
$(call inherit-product, device/lge/mm1v/device.mk)

PRODUCT_DEVICE := mm1v
PRODUCT_NAME := full_mm1v
PRODUCT_BRAND := lge
PRODUCT_MODEL := MM1V
PRODUCT_MANUFACTURER := lge
