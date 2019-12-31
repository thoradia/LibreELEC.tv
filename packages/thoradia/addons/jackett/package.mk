PKG_NAME="jackett"
PKG_VERSION="bootstrap"
PKG_REV="49"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/Jackett/Jackett"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jackett"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: proxy to tracker sites"
PKG_LONGDESC="${PKG_ADDON_NAME} works as a proxy server: it translates queries from applications (CouchPotato, Mylar, SickRage, Sonarr, etc.) into tracker-site-specific HTTP queries, parses the HTML response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping and translation logic, removing the burden from other applications."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

if [ "${DEVICE}" == "RPi" ]; then
  PKG_ADDON_REQUIRES="tools.mono:0.0.0 ${PKG_ADDON_REQUIRES}"
fi

addon() {
  :
}
