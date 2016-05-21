# TARGET #

TARGET := 3DS
LIBRARY := 0

ifeq ($(TARGET),3DS)
    ifeq ($(strip $(DEVKITPRO)),)
        $(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro")
    endif

    ifeq ($(strip $(DEVKITARM)),)
        $(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
    endif
endif

# COMMON CONFIGURATION #

NAME := Template

BUILD_DIR := build
OUTPUT_DIR := output
INCLUDE_DIRS := include
SOURCE_DIRS := source

EXTRA_OUTPUT_FILES :=

LIBRARY_DIRS := $(DEVKITPRO)/citrus $(DEVKITPRO)/libctru
LIBRARIES := ctru m

BUILD_FLAGS := -DLIBKHAX_AS_LIB -DVERSION_STRING="\"`git describe --tags --abbrev=0`\""
RUN_FLAGS :=

#OUTPUT_ZIP_FILE := $(OUTPUT_DIR)/$(NAME)-$(shell date +'%Y%m%d-%H%M%S').zip
OUTPUT_ZIP_FILE := $(NAME).zip

# 3DS CONFIGURATION #

# NetLink IP
REMOTE_IP := 127.0.0.1

TITLE := $(NAME)
DESCRIPTION := Description
AUTHOR := Author
PRODUCT_CODE := CTR-P-CODE
UNIQUE_ID := 0x0000

SYSTEM_MODE := 64MB
SYSTEM_MODE_EXT := Legacy

ICON_FLAGS :=

ROMFS_DIR := romfs/
BANNER_AUDIO := meta/banner.wav
BANNER_IMAGE := meta/banner.png
ICON := meta/icon.png

# INTERNAL #

include buildtools/make_base