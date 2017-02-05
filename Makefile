include $(TOPDIR)/rules.mk

PKG_NAME:=helloworldpython
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Federico Pfaffendorf 
PKG_LICENSE:=GPL

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

define Package/helloworldpython
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Python Hello World Example
  MENU:=1
endef

define Package/helloworldpython/description
  Hello World Example Written in Python
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) $(TARGET_CONFIGURE_OPTS)
endef

define Package/helloworldpython/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/helloworld.pyc $(1)/bin/
endef

$(eval $(call BuildPackage,helloworldpython))
