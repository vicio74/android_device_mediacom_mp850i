# Copyright (C) 2012 The Android Open Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS := device/mediacom/mp850i/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/rk29xxnand_ko.ko:root/rk29xxnand_ko.ko \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.rk29board.rc:root/init.rk29board.rc \
    $(LOCAL_PATH)/ramdisk/init.rk29board.usb.rc:root/init.rk29board.usb.rc \
    $(LOCAL_PATH)/ramdisk/misc.img:root/misc.img \
    $(LOCAL_PATH)/ramdisk/ueventd.rk29board.rc:root/ueventd.rk29board.rc

# Prebuilt configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/call-pppd:system/etc/ppp/call-pppd \
    $(LOCAL_PATH)/configs/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/configs/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/rk29-keypad.kl:/system/usr/keylayout/rk29-keypad.kl \
    $(LOCAL_PATH)/configs/qwerty.idc:/system/usr/idc/qwerty.idc \
    $(LOCAL_PATH)/configs/qwerty2.idc:/system/usr/idc/qwerty2.idc

# Prebuilt kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/galcore.ko:system/lib/modules/galcore.ko \
    $(LOCAL_PATH)/modules/rk29-ipp.ko:system/lib/modules/rk29-ipp.ko \
    $(LOCAL_PATH)/modules/wlan.ko:system/lib/modules/wlan.ko

# init.d scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.d/03kernel:system/etc/init.d/03kernel \
    $(LOCAL_PATH)/init.d/04mount:system/etc/init.d/04mount

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
    
PRODUCT_PACKAGES := \
    HoloSpiralWallpaper \
    LiveWallpapersPicker \
    VisualizationWallpapers \

PRODUCT_PACKAGES += \
    Camera

PRODUCT_PACKAGES += \
    audio.primary.default \
    audio_policy.default

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory
    
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

PRODUCT_PROPERTY_OVERRIDES := \
    service.adb.root=1 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Europe/Rome \
    persist.sys.language=it \
    persist.sys.country=IT \
    persist.sys.use_dithering=1 \
    persist.sys.purgeable_assets=0 \
    windowsmgr.max_events_per_sec=240 \
    view.touch_slop=2 \
    view.minimum_fling_velocity=25 \
    ro.additionalmounts=/mnt/external_sd \
    ro.vold.switchablepair=/mnt/sdcard,/mnt/external_sd \
    persist.sys.vold.switchexternal=0

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay
   
PRODUCT_AAPT_CONFIG := large mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

TARGET_BOOTANIMATION_NAME := horizontal-1024x600

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product-if-exists, vendor/mediacom/mp850i/mp850i-vendor.mk)