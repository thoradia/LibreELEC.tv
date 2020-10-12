PKG_NAME="lidarr"
PKG_VERSION="0.7.1.1381"
PKG_SHA256="f97a4ee981f69330476d4434e5089bc7bfb281c6420541086b9321b234cd61ee"
PKG_REV="11"
PKG_LICENSE="GPLv3"
PKG_SITE="http://lidarr.audio/"
PKG_URL="https://github.com/lidarr/Lidarr/releases/download/v${PKG_VERSION}/Lidarr.master.${PKG_VERSION}.linux.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Lidarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.mono:0.0.0 virtual.thoradia-mono:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a music collection manager for Usenet and BitTorrent users"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
