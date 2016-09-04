include $(TOPDIR)/rules.mk

PKG_NAME:=lv
PKG_VERSION:=4.51
PKG_RELEASE:=1

PKG_SOURCE_SUBDIR:=$(PKG_NAME)$(shell echo $(PKG_VERSION) | tr -d .)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_SOURCE_URL:=https://web.archive.org/web/20150915000000/http://www.ff.iij4u.or.jp/~nrt/freeware/
PKG_MD5SUM:=85b70ae797f935741ec9a1cbe92f00e9

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=GPL.txt

PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

define Package/lv/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Powerful multi-lingual file viewer/grep
  URL:=https://web.archive.org/web/20160310122517/http://www.ff.iij4u.or.jp/~nrt/lv/
  DEPENDS:=+libncursesw
endef

define Package/lv/Default/description
  Powerful multi-lingual file viewer/grep
endef

define Package/lv
  $(call Package/lv/Default)
#  MAINTAINER:=Yoshio HANAWA <for-openwrt@hnw.jp>
#  MENU:=1
endef

define Package/lv/description
  $(call Package/lv/Default/description)
endef

CONFIGURE_PATH = ./src
MAKE_PATH:=./src

define Build/Prepare
	$(call Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR)/src ; $(CP) configure.in configure.in.orig ; sed -e 's!ncurses,!ncursesw,!' configure.in.orig > configure.in ; autoreconf -ihv )
	( cd $(PKG_BUILD_DIR)/src ; $(CP) conf.c conf.c.orig ; sed -e 's!_SYSTEM\tEUC_JAPAN!_SYSTEM\tUTF_8!' conf.c.orig > conf.c )
endef

define Build/Install
	true
endef

define Package/lv/install
        $(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/lv
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/lv $(1)/usr/bin/
	$(LN) lv $(1)/usr/bin/lgrep
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/lv.hlp $(1)/usr/lib/lv/
endef

$(eval $(call BuildPackage,lv))
