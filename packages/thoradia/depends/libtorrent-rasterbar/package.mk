PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_1_3"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/archive/libtorrent-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="libtorrent-libtorrent-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain boost libiconv libressl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"
PKG_USE_CMAKE="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-python-binding \
                           --with-boost-libdir=$SYSROOT_PREFIX/usr/lib \
                           --with-libiconv"

post_unpack() {
  mkdir -p $ROOT/$PKG_BUILD/build-aux/
  touch $ROOT/$PKG_BUILD/build-aux/config.rpath
}

pre_configure_target() {
  cp -PR ../* .
}
