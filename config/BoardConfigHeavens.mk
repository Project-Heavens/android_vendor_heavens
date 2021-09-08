include vendor/heavens/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/heavens/config/BoardConfigQcom.mk
endif

include vendor/heavens/config/BoardConfigSoong.mk
