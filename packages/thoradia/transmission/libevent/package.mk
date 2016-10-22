PKG_NAME="libevent"
PKG_VERSION="2.0.22-stable"
PKG_LICENSE="BSD"
PKG_SITE="http://libevent.org/"
PKG_URL="https://github.com/libevent/libevent/releases/download/release-$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libressl zlib"
PKG_SHORTDESC="libevent: a library for asynchronous event notification"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --enable-openssl"

post_makeinstall_target() {
  rm -fr $INSTALL
}
