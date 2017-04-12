PKG_NAME="thoradia-locale"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"

CHARMAP="UTF-8"
LOCALE="en_US"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Thoradia Locale"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="thoradia"
PKG_REV="1"
PKG_SHORTDESC="$PKG_ADDON_NAME: the $LOCALE.$CHARMAP locale"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_REV) provides the $LOCALE.$CHARMAP locale."
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  LOCPATH="$ADDON_BUILD/$PKG_ADDON_ID"
  mkdir -p "$LOCPATH"
  I18NPATH="$(get_build_dir glibc)/localedata" localedef -f "$CHARMAP" -i "$LOCALE" "$LOCPATH/locale"
}
