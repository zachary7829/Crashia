ARCHS = arm64 arm64e
TARGET = iphone:clang:14.8.1:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CrashiaPrefs

CrashiaPrefs_FILES = ZLCABRootListController.m
CrashiaPrefs_FRAMEWORKS = UIKit
CrashiaPrefs_PRIVATE_FRAMEWORKS = Preferences
CrashiaPrefs_INSTALL_PATH = /Library/PreferenceBundles
CrashiaPrefs_CFLAGS = -fobjc-arc
CrashiaPrefs_LIBRARIES = sparkapplist

include $(THEOS_MAKE_PATH)/bundle.mk
