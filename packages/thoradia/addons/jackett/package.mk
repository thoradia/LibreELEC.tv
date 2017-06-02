PKG_NAME="jackett"
PKG_VERSION="0.7.1437"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/Jackett/Jackett"
PKG_URL="https://github.com/Jackett/Jackett/releases/download/v$PKG_VERSION/Jackett.Binaries.Mono.tar.gz"
PKG_SOURCE_DIR="Jackett"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jackett"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.mono:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_REV="23"
PKG_SHORTDESC="$PKG_ADDON_NAME: proxy to tracker sites"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) works as a proxy server: it translates queries from applications (CouchPotato, Mylar, SickRage, Sonarr,  etc.) into tracker-site-specific HTTP queries, parses the HTML response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping and translation logic, removing the burden from other applications."
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/Jackett
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/Jackett
}
