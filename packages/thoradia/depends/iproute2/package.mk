PKG_NAME="iproute2"
PKG_VERSION="5.9.0"
PKG_SHA256="0510b9c1dc2d7ea4cff5f0752df9b995a2148e1015f3c0a02cfa07ff2e4f98bb"
PKG_LICENSE="GPLv2"
PKG_SITE="https://wiki.linuxfoundation.org/networking/iproute2"
PKG_URL="https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A set of utilities for Linux networking."

PKG_BUILD_FLAGS="-sysroot"
PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static"

pre_configure_target() {
  cd ..
}
