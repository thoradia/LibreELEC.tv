PKG_NAME="iproute2"
PKG_VERSION="5.10.0"
PKG_SHA256="09cf5d54ef1625a46e1d5f9a6e7ad3bc1520d17f27d153b3e33eea185402f263"
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
