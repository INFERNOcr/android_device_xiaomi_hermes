LOCAL_PATH := device/xiaomi/hermes


#Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

#Camera
USE_CAMERA_STUB := true
TARGET_PROVIDES_INIT_RC := true

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true

TARGET_BOARD_PLATFORM := mt6795
PRODUCT_SHIPPING_API_LEVEL := 21

# CPU
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
endif

# FIX Freezing
TARGET_NO_SENSOR_PERMISSION_CHECK := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := mt6795

# EXT4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/hw/rild=27 \
    /system/bin/audioserver=22 \
    /system/vendor/bin/hw/android.hardware.audio@2.0-service=22

LZMA_RAMDISK_TARGETS := recovery

# RIL
# moved to forked frameworks_opt_telephony repo
#BOARD_RIL_CLASS := ../../../$(DEVICE_FOLDER)/ril/
MTK_DT_SUPPORT := no
MTK_VT3G324M_SUPPORT := no
MTK_SHARE_MODEM_CURRENT := 1
MTK_SHARE_MODEM_SUPPORT := 2
MTK_IPV6_SUPPORT := yes
MTK_LTE_SUPPORT := yes
MTK_LTE_DC_SUPPORT := no
MTK_SVLTE_SUPPORT := no
MTK_EAP_SIM_AKA := yes
MTK_IRAT_SUPPORT := no
MTK_DTAG_DUAL_APN_SUPPORT := no
MTK_MD1_SUPPORT := 5
MTK_MD2_SUPPORT := 4
MTK_MD3_SUPPORT := 2
MTK_MD5_SUPPORT := 5
MTK_ENABLE_MD1 = yes
MTK_ENABLE_MD2 = no
MTK_ENABLE_MD3 = no
MTK_ENABLE_MD5 = no

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_MTK_AUDIO := true

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := \
    --base 0x40078000 \
    --board mt6795 \
    --kernel_offset 0x00008000 \
    --pagesize 2048 \
    --ramdisk_offset 0x03f88000 \
    --second_offset 0x00e88000 \
    --tags_offset 0x0df88000

#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
#KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/toolchain/bin

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048
#TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_HAVE_NEW_GRALLOC := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_NEW_ION_API := true
TARGET_USES_HWC2 := true

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_BOARD_KERNEL_HEADERS := device/xiaomi/hermes/kernel-headers
# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Power and native tap-to-wake
TARGET_POWERHAL_VARIANT := mtk-xen0n
TARGET_POWER_SET_FEATURE_LIB := power-feature-arale

# Audio
BOARD_USES_MTK_AUDIO := true
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# Wifi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES :=true

# FM
MTK_FM_SUPPORT :=yes
MTK_FM_RX_SUPPORT :=yes

# Consumerir
MTK_IRTX_SUPPORT :=true

# make_ext4fs requires numbers in dec format
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_PROTECT_FIMAGE_PARTITION_SIZE:=10485760
BOARD_PROTECT_SIMAGE_PARTITION_SIZE:=10485760
BOARD_SECROIMAGE_PARTITION_SIZE:=0x600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=0x127000000
BOARD_CACHEIMAGE_PARTITION_SIZE:=0x14000000
BOARD_USERDATAIMAGE_PARTITION_SIZE:=1240465408
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x2000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x2000000
BOARD_FLASH_BLOCK_SIZE := 4096

#BINARY
TARGET_LD_SHIM_LIBS := \
		/system/bin/6620_launcher|libmtk_symbols.so \
		/system/bin/nvram_agent_binder|libmtk_symbols.so \
		/system/bin/thermal|libmtk_symbols.so \
		/system/bin/thermald|libmtk_symbols.so \
		/system/bin/thermal_manager|libmtk_symbols.so \
		/system/bin/wmt_loader|libmtk_symbols.so

#32BIT
TARGET_LD_SHIM_LIBS += \
		/system/vendor/lib/libsrv_um.so|libutilscallstack.so \
		/system/lib/libdpframework.so|libmtk_symbols.so \
		/system/lib/libgralloc_extra.so|libmtk_symbols.so \
		/system/lib/hw/hwcomposer.mt6795.so|libmtk_symbols.so \
		/system/lib/librilmtk.so|libmtk_symbols.so \
		/system/lib/librilmtkmd2.so|libmtk_symbols.so \
		/system/lib/libmtk-ril.so|libmtk_symbols.so \
		/system/lib/libmtcloader.so|libmtk_symbols.so \
		/system/lib/libcustom_nvram.so|libmtk_symbols.so \
		/system/lib/hw/audio.primary.mt6795.so|libmtk_symbols.so \
		/system/lib/hw/sensors.mt6795.so|libmtk_symbols.so \
		/system/lib/hw/keystore.mt6795.so|libmtk_symbols.so

#64BIT
TARGET_LD_SHIM_LIBS += \
		/system/vendor/lib64/libsrv_um.so|libutilscallstack.so \
		/system/lib64/libdpframework.so|libmtk_symbols.so \
		/system/lib64/libgralloc_extra.so|libmtk_symbols.so \
		/system/lib64/hw/hwcomposer.mt6795.so|libmtk_symbols.so \
		/system/lib64/librilmtk.so|libmtk_symbols.so \
		/system/lib64/librilmtkmd2.so|libmtk_symbols.so \
		/system/lib64/libcustom_nvram.so|libmtk_symbols.so \
		/system/lib64/hw/audio.primary.mt6795.so|libmtk_symbols.so \
		/system/lib64/hw/sensors.mt6795.so|libmtk_symbols.so \
		/system/lib64/hw/keystore.mt6795.so|libmtk_symbols.so

# Seccomp
TARGET_DOES_NOT_SUPPORT_SECCOMP := true


# CWM
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/recovery.fstab
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file

# TWRP FLAGS
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_NO_USB_STORAGE := true
TW_EXCLUDE_SUPERSU := true

# system.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop
# Sepolicy
BOARD_SEPOLICY_DIRS += device/xiaomi/hermes/sepolicy
POLICYVERS := 28

# HIDL
DEVICE_MANIFEST_FILE := \
    $(LOCAL_PATH)/manifest.xml

# Build kernel without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# Misc
#BLOCK_BASED_OTA := false

# SELinux
#BOARD_SEPOLICY_DIRS := \
#       device/htc/a55ml_dtul/sepolicy
