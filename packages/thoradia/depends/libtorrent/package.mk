PKG_NAME="libtorrent"
PKG_VERSION="0.13.8"
PKG_SHA256="0f6c2e7ffd3a1723ab47fdac785ec40f85c0a5b5a42c1d002272205b988be722"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rakshasa/libtorrent"
PKG_URL="https://github.com/rakshasa/${PKG_NAME}/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl zlib"
PKG_LONGDESC="libtorrent"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-debug \
                           --disable-shared"
