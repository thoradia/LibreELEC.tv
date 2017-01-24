PKG_NAME="sonarr"
PKG_VERSION="2.0.0.4472"
PKG_LICENSE="GPL3"
PKG_SITE="https://sonarr.tv/"
PKG_URL="http://download.sonarr.tv/v2/master/mono/NzbDrone.master.$PKG_VERSION.mono.tar.gz"
PKG_DEPENDS_TARGET="toolchain thoradia_libmediainfo"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Sonarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.mono:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_REV="10"
PKG_SHORTDESC="$PKG_ADDON_NAME: a PVR for Usenet and BitTorrent users"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available."
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
