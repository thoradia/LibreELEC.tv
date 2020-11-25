PKG_NAME="ipset"
PKG_VERSION="7.9"
PKG_SHA256="b75c13689eddf1d95b396840a69dc04fd7ae4112b10b70594bc0405df7b9b30a"
PKG_LICENSE="GPLv2"
PKG_SITE="https://ipset.netfilter.org/"
PKG_URL="https://ipset.netfilter.org/ipset-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libmnl"
PKG_LONGDESC="Tool to administer IP sets."

PKG_BUILD_FLAGS="-sysroot"
PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static"
