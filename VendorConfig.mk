VND_MTK_PATH := device/xiaomi/hermes

TARGET_SPECIFIC_HEADER_PATH := $(VND_MTK_PATH)/include

# Fragments include
-include $(VND_MTK_PATH)/board/*.mk
