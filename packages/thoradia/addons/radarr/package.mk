PKG_NAME="radarr"
PKG_VERSION="0.2.0.375"
PKG_LICENSE="Public Domain"
PKG_SITE="https://github.com/Radarr/Radarr"
PKG_URL="https://github.com/Radarr/Radarr/releases/download/v$PKG_VERSION/Radarr.develop.$PKG_VERSION.linux.tar.gz"
PKG_DEPENDS_TARGET="toolchain thoradia_libmediainfo"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Radarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.mono:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_REV="4"
PKG_SHORTDESC="$PKG_ADDON_NAME: a fork of Sonarr to work with movies à la CouchPotato"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a fork of Sonarr to work with movies à la CouchPotato."
PKG_DISCLAIMER="Keep it legal and carry on"

unpack() {
  mkdir -p $PKG_BUILD
}

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/lib"
  tar xzf "$ROOT/$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME" -C "$ADDON_BUILD/$PKG_ADDON_ID"
  cp -L $(get_build_dir thoradia_libmediainfo)/.install_pkg/usr/lib/libmediainfo.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib/
}
