ARCHS = arm64 arm64e
TARGET = iphone:clang:14.8.1:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Crashia

Crashia_FILES = Tweak.xm
Crashia_CFLAGS = -fobjc-arc
Crashia_EXTRA_FRAMEWORKS += Cephei
Crashia_PRIVATE_FRAMEWORKS = SpringBoardServices MobileCoreServices
Crashia_LIBRARIES = sparkapplist

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += crashiaprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
