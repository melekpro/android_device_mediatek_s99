# mt6580 platform boardconfig
LOCAL_PATH := device/blocks/sombrero

# HWC1 still, set this before including vendor/mad
TARGET_USES_HWC1 := true

include vendor/mad/config/board.mk

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

USE_CAMERA_STUB := true

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6580
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

TARGET_BOOTLOADER_BOARD_NAME := mt6580

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL -DDISABLE_ASHMEM_TRACKING
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

BOARD_USES_MTK_HARDWARE := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 androidboot.selinux=permissive
BOARD_KERNEL_BASE = 0x80000000
BOARD_KERNEL_OFFSET = 0x00008000
BOARD_RAMDISK_OFFSET = 0x04000000
BOARD_TAGS_OFFSET = 0xE000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)
TARGET_KERNEL_SOURCE := kernel/blocks/sombrero
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CONFIG := sf6580_weg_l_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_KERNEL_IMAGE_NAME := zImage-dtb

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_SCREEN_HEIGHT := 400
TARGET_SCREEN_WIDTH := 400
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Flags
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# HeartRate Sensor workaround
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES := true

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE      := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 998244352
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 1610612736
BOARD_CACHEIMAGE_PARTITION_SIZE     := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_FLASH_BLOCK_SIZE              := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

RECOVERY_VARIANT := twrp

ifeq ($(RECOVERY_VARIANT),twrp)
# TARGET_RECOVERY_FSTAB := device/blocks/sombrero/recovery/etc/twrp.fstab
TW_THEME := watch_mdpi
TW_ROUND_SCREEN := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INCLUDE_FB2PNG := true
TW_REBOOT_BOOTLOADER := true
TW_REBOOT_RECOVERY := true
BOARD_HAS_FLIPPED_SCREEN := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_SUPERSU := true
#else
#TARGET_RECOVERY_FSTAB := device/blocks/sombrero/recovery.fstab
endif
TARGET_RECOVERY_FSTAB := device/blocks/sombrero/recovery/etc/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# RIL
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

# Include needed symbols
TARGET_INCLUDE_XLOG_SYMBOLS := true
TARGET_INCLUDE_AUDIO_SYMBOLS := true
TARGET_INCLUDE_UI_SYMBOLS := true
TARGET_INCLUDE_GUI_SYMBOLS := true
TARGET_INCLUDE_OMX_SYMBOLS := true
include vendor/mad/config/symbols.mk

DEBUG_BOOT := true
TARGET_SYSTEM_MINOR := 18

# SELinux
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy
