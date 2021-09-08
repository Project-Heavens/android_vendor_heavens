# Inherit common Lineage stuff
$(call inherit-product, vendor/heavens/config/common.mk)

# Inherit Lineage atv device tree
$(call inherit-product, device/heavens/atv/heavens_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Lineage packages
PRODUCT_PACKAGES += \
    LineageCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/heavens/overlay/tv
