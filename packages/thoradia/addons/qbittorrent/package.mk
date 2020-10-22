PKG_NAME="qbittorrent"
PKG_VERSION="4.3.0.1"
PKG_SHA256="af17daa57d750522357393aca32a4dd57f5b0f271f2c49b3ce6908baee5ed93b"
PKG_REV="33"
PKG_LICENSE="GPLv2"
PKG_SITE="http://www.qbittorrent.org/"
PKG_URL="https://github.com/qbittorrent/qBittorrent/archive/release-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libtorrent-rasterbar qt-everywhere"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="qBittorrent"
PKG_MAINTAINER="thoradia"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: efficient feature complete C++ bittorrent implementation"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is an efficient feature complete C++ bittorrent implementation."
PKG_ADDON_TYPE="xbmc.service"
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CMAKE_OPTS_TARGET="-DBoost_USE_STATIC_LIBS=ON \
                       -DDBUS:BOOL=OFF \
                       -DGUI:BOOL=OFF"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P ${PKG_INSTALL}/usr/bin/qbittorrent-nox \
          ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}
