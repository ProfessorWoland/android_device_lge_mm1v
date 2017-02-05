#
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

TARGET_BOARD_PLATFORM := mt6735

DEVICE_PATH := device/lge/mm1v

MTK_PROJECT_CONFIG ?= $(DEVICE_PATH)/ProjectConfig.mk
include $(MTK_PROJECT_CONFIG)
#change if needed
include device/cyanogen/mt6735-common/BoardConfigCommon.mk

#what the hell is this do I need it?
MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$($(t))\"))

COMMON_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)
COMMON_GLOBAL_CPPFLAGS += $(MTK_INTERNAL_CDEFS)

#not sure where is this, maybe need to be located created or something
#try something like this if it failscyanogenmod_mm1v_defconfig
TARGET_KERNEL_CONFIG := muse6735_m1v_m_defconfig

TARGET_BOOTLOADER_BOARD_NAME := MM1V

#promeniti kad skontam koliko je.. skontao :D
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=2879565824
BOARD_CACHEIMAGE_PARTITION_SIZE:=318767104
BOARD_USERDATAIMAGE_PARTITION_SIZE:=3807903744

#don't know what is this, it will wait
TARGET_INIT_VENDOR_LIB := libinit_mm1v

#i don't know where is this on my phone now..
TARGET_TAP_TO_WAKE_NODE := /sys/devices/virtual/input/lge_touch/knock_on_type

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy


