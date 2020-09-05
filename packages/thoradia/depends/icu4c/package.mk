PKG_NAME="icu4c"
PKG_VERSION="67-1"
PKG_SHA256="571d3723a8055d85e513b19b70b4f7f370da10df084c3bb598e0fb8333da0a16"
PKG_LICENSE="https://github.com/unicode-org/icu/blob/master/icu4c/LICENSE"
PKG_SITE="http://www.icu-project.org"
PKG_URL="https://github.com/unicode-org/icu/archive/release-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain:host"
PKG_DEPENDS_TARGET="toolchain icu4c:host"
PKG_LONGDESC="International Components for Unicode library."

PKG_BUILD_FLAGS="-sysroot"

configure_package() {
  PKG_CONFIGURE_SCRIPT="${PKG_BUILD}/icu4c/source/configure"
  PKG_CONFIGURE_OPTS_TARGET="--disable-extras \
                             --disable-renaming \
                             --disable-samples \
                             --disable-tests \
                             --disable-tools \
                             --with-cross-build=${PKG_BUILD}/.${HOST_NAME}"
}
