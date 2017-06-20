PKG_NAME="rtorrent"
PKG_VERSION="0.9.6"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rakshasa/rtorrent"
PKG_URL="https://github.com/rakshasa/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libtorrent curl netbsd-curses screen xmlrpc-c"
PKG_AUTORECONF="yes"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="rTorrent"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="4"
PKG_SHORTDESC="$PKG_ADDON_NAME: quick and efficient BitTorrent client"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a quick and efficient BitTorrent client"
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-debug \
                           --disable-shared \
                           --with-xmlrpc-c=$SYSROOT_PREFIX/usr/bin/xmlrpc-c-config"

pre_configure_target() {
  export LIBS="-lncurses -lterminfo"
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -L $PKG_BUILD/.install_pkg/usr/bin/rtorrent \
        $(get_build_dir screen)/screen \
        $ADDON_BUILD/$PKG_ADDON_ID/bin/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/doc
  cp -L $PKG_BUILD/doc/rtorrent.rc \
        $ADDON_BUILD/$PKG_ADDON_ID/doc/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -L $(get_build_dir xmlrpc-c)/.install_pkg/usr/lib/libxmlrpc.so.? \
        $(get_build_dir xmlrpc-c)/.install_pkg/usr/lib/libxmlrpc_server.so.? \
        $(get_build_dir xmlrpc-c)/.install_pkg/usr/lib/libxmlrpc_util.so.?\
        $ADDON_BUILD/$PKG_ADDON_ID/lib/
}
