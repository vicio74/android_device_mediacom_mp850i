#
# Copyright (C) 2012 The Android Open-Source Project
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
#

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Use the non-open-source parts, if they're present
-include vendor/mediacom/mp850i/BoardConfigVendor.mk

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

BOARD_USES_HC_RADIO := true

TARGET_NO_BOOTLOADER := true

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := rk29sdk
TARGET_BOOTLOADER_BOARD_NAME := rk29board
TARGET_PROVIDES_INIT_RC := true

BOARD_EGL_CFG := device/mediacom/mp850i/egl.cfg
USE_OPENGL_RENDERER := true
ENABLE_WEBGL := true
BOARD_USE_SKIA_LCDTEXT := true

TARGET_USES_ION := true

TARGET_RECOVERY_INITRC := device/mediacom/mp850i/recovery.init.rc
TARGET_RECOVERY_PRE_COMMAND := "busybox dd if=/misc.img of=/dev/block/mtd/by-name/misc; sync"
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

BOARD_WLAN_DEVICE := rtl8192cu

WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM   := ""
WIFI_DRIVER_FW_PATH_STA     := ""
WIFI_DRIVER_FW_PATH_AP      := ""
WIFI_DRIVER_FW_PATH_P2P     := ""
WIFI_DRIVER_MODULE_NAME     := "wlan"
WIFI_DRIVER_MODULE_ARG      := ""

BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 482344960
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1572864000

TARGET_PREBUILT_KERNEL := device/mediacom/mp850i/kernel

TARGET_BOOTANIMATION_PRELOAD := true

BOARD_USE_LEGACY_TOUCHSCREEN := true

TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/mediacom/mp850i/releasetools/mp850i_ota_from_target_files

BOARD_HAVE_BLUETOOTH := true

# For WebKit rendering issue
TARGET_FORCE_CPU_UPLOAD := true

BOARD_TOUCH_RECOVERY := true
#BOARD_CUSTOM_BOOTIMG_MK := device/mediacom/mp850i/custombootimg.mk
BOARD_USE_CUSTOM_RECOVERY_FONT := \"font_10x18.h\"
