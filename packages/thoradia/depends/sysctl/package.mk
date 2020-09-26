PKG_NAME="sysctl"
PKG_VERSION="3.3.16"
PKG_SHA256="720caf307ab5dfe6d1cf4fc3e6ce786d749c69baa088627dbe1b01828f2528b1"
PKG_LICENSE="GPL"
PKG_SITE="https://gitlab.com/procps-ng/procps"
PKG_URL="https://gitlab.com/procps-ng/procps/-/archive/v${PKG_VERSION}/procps-v${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain ncurses"
PKG_LONGDESC="Command line and full screen utilities for browsing procfs."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_realloc_0_nonnull=yes \
                           --disable-shared \
                           --enable-static"

PKG_MAKE_OPTS_TARGET="sysctl"

makeinstall_target() {
  :
}