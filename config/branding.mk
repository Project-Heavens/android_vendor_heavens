HEAVENS_VARIANT ?= VANILLA
HEAVENS_BUILD_VERSION := 2.0
HEAVENS_CODENAME := Ruby

# System version
TARGET_PRODUCT_SHORT := $(subst heavens_,,$(HEAVENS_BUILD_TYPE))

HEAVENS_DATE_YEAR := $(shell date -u +%Y)
HEAVENS_DATE_MONTH := $(shell date -u +%m)
HEAVENS_DATE_DAY := $(shell date -u +%d)
HEAVENS_DATE_HOUR := $(shell date -u +%H)
HEAVENS_DATE_MINUTE := $(shell date -u +%M)

# Official Build
ifeq ($(HEAVENS_BUILD_TYPE), OFFICIAL)
    HEAVENS_BUILD_TYPE := OFFICIAL
else
    HEAVENS_BUILD_TYPE := UNOFFICIAL
endif

# Gapps
ifeq ($(WITH_GAPPS), true)
    HEAVENS_VARIANT := GAPPS
$(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif

HEAVENS_BUILD_DATE := $(HEAVENS_DATE_YEAR)$(HEAVENS_DATE_MONTH)$(HEAVENS_DATE_DAY)-$(HEAVENS_DATE_HOUR)$(HEAVENS_DATE_MINUTE)
HEAVENS_VERSION := Project-Heavens-$(HEAVENS_BUILD_VERSION)-$(HEAVENS_BUILD_TYPE)-$(HEAVENS_BUILD)-$(HEAVENS_VARIANT)-$(HEAVENS_BUILD_DATE)
HEAVENS_BUILD_FINGERPRINT := Project-Heavens/$(HEAVENS_VERSION)/$(TARGET_PRODUCT_SHORT)/$(HEAVENS_BUILD_DATE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.heavens.version=$(HEAVENS_VERSION) \
  ro.heavens.build.version=$(HEAVENS_BUILD_VERSION) \
  ro.heavens.build.type=$(HEAVENS_BUILD_TYPE) \
  ro.heavens.build.variant=$(HEAVENS_VARIANT) \
  ro.heavens.build.date=$(HEAVENS_BUILD_DATE) \
  ro.heavens.build.fingerprint=$(HEAVENS_BUILD_FINGERPRINT) \
  ro.heavens.build.codename=$(HEAVENS_CODENAME)
