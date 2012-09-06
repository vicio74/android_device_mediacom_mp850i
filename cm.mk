# Inherit device configuration for MP850i.
$(call inherit-product, device/mediacom/mp850i/full_mp850i.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_mp850i
PRODUCT_BRAND := mediacom
PRODUCT_DEVICE := mp850i
PRODUCT_MODEL := MP850i
PRODUCT_MANUFACTURER := Mediacom
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9100 PRODUCT_BRAND=samsung BUILD_ID=IML74K BUILD_FINGERPRINT=samsung/GT-I9100/GT-I9100:4.0.3/IML74K/BGLP8:user/release-keys PRIVATE_BUILD_DESC="GT-I9100-user 4.0.3 IML74K BGLP8 release-keys" BUILD_NUMBER=BGLP8
