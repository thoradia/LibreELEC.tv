PKG_NAME="rtorrent"
PKG_VERSION="0.9.8"
PKG_SHA256="bc889ce1dde475ec56aa72ae996912ff58723226a4f4256fef4f1f8636d991d4"
PKG_REV="11"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rakshasa/rtorrent"
PKG_URL="https://github.com/rakshasa/${PKG_NAME}/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl libtorrent ncurses screen xmlrpc-c"
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="rTorrent"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: quick and efficient BitTorrent client"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a quick and efficient BitTorrent client."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CONFIGURE_OPTS_TARGET="--disable-debug \
                           --with-xmlrpc-c=${SYSROOT_PREFIX}/usr/bin/xmlrpc-c-config"

pre_configure_target() {
  export LIBS="-lncurses -l:libxmlrpc_server.a -l:libxmlrpc.a -l:libxmlrpc_util.a "
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -LR ${PKG_INSTALL}/usr/bin/rtorrent \
           $(get_install_dir screen)/usr/bin/screen \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/doc
    cp -PR ${PKG_BUILD}/doc/rtorrent.rc \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/doc
}
