PKG_NAME="par2cmdline"
PKG_VERSION="0.8.1"
PKG_SHA256="529f85857ec44e501cd8d95b0c8caf47477d7daa5bfb989e422c800bb71b689a"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/Parchive/par2cmdline"
PKG_URL="https://github.com/Parchive/$PKG_NAME/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="par2cmdline: a PAR 2.0 compatible file verification and repair tool"
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
  ln -fs $INSTALL/usr/bin/par2 $INSTALL/usr/bin/par2create
  ln -fs $INSTALL/usr/bin/par2 $INSTALL/usr/bin/par2repair
  ln -fs $INSTALL/usr/bin/par2 $INSTALL/usr/bin/par2verify
}
