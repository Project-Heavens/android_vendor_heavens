# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# Heavens OTA update package

#
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)
ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/heavens/build/core/colors.mk
endif

HEAVENS_TARGET_PACKAGE := $(PRODUCT_OUT)/$(HEAVENS_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: heavens
heavens: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(HEAVENS_TARGET_PACKAGE)
	$(hide) $(MD5) $(HEAVENS_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(HEAVENS_TARGET_PACKAGE).md5sum
	#@echo "Package Complete: $(HEAVENS_TARGET_PACKAGE)" >&2

	@echo  ${CL_YLW}""${CL_YLW}
	@echo -e ${CL_YLW}"        8888888b.  8888888b.   .d88888b. 888888 8888888888 .d8888b. 88888888888     "${CL_YLW}
	@echo -e ${CL_YLW}"        888   Y88b 888   Y88b d88P' 'Y88b   88b 888       d88P  Y88b    888         "${CL_YLW}
	@echo -e ${CL_YLW}"        888    888 888    888 888     888   888 888       888    888    888         "${CL_YLW}
	@echo -e ${CL_YLW}"        888   d88P 888   d88P 888     888   888 8888888   888           888         "${CL_YLW}
	@echo -e ${CL_YLW}"        8888888P'  8888888P'  888     888   888 888       888           888         "${CL_YLW}
	@echo -e ${CL_YLW}"        888        888 T88b   888     888   888 888       888    888    888         "${CL_YLW}
	@echo -e ${CL_YLW}"        888        888  T88b  Y88b. .d88P   88P 888       Y88b  d88P    888         "${CL_YLW}
	@echo -e ${CL_YLW}"        888        888   T88b  'Y88888P'    888 8888888888 'Y8888P'     888         "${CL_YLW}
	@echo -e ${CL_YLW}"                                          .d88P                                     "${CL_YLW}
	@echo -e ${CL_YLW}"                                        .d88P'                                      "${CL_YLW}
	@echo -e ${CL_YLW}"                                       888P'                                        "${CL_YLW}
	@echo -e ${CL_YLW}"  888    888 8888888888        d8888 888     888 8888888888 888b    888  .d8888b.   "${CL_YLW}
	@echo -e ${CL_YLW}"  888    888 888              d88888 888     888 888        8888b   888 d88P  Y88b  "${CL_YLW}
	@echo -e ${CL_YLW}"  888    888 888             d88P888 888     888 888        88888b  888 Y88b.       "${CL_YLW}
	@echo -e ${CL_YLW}"  8888888888 8888888        d88P 888 Y88b   d88P 8888888    888Y88b 888  'Y888b.    "${CL_YLW}
	@echo -e ${CL_YLW}"  888    888 888           d88P  888  Y88b d88P  888        888 Y88b888     'Y88b.  "${CL_YLW}
	@echo -e ${CL_YLW}"  888    888 888          d88P   888   Y88o88P   888        888  Y88888       '888  "${CL_YLW}
	@echo -e ${CL_YLW}"  888    888 888         d8888888888    Y888P    888        888   Y8888 Y88b  d88P  "${CL_YLW}
	@echo -e ${CL_YLW}"  888    888 8888888888 d88P     888     Y8P     8888888888 888    Y888  'Y8888P'   "${CL_YLW}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RST}"                         Build completed! GO TO HEAVENS NOW!                        "${CL_RST}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_GRN}"===================================================================================="${CL_GRN}
	@echo -e ${CL_RST}""Package Complete: "$(HEAVENS_TARGET_PACKAGE)"${CL_RST}
	@echo -e ${CL_GRN}"===================================================================================="${CL_GRN}
