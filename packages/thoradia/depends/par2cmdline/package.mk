PKG_NAME="par2cmdline"
PKG_VERSION="0.6.13"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/Parchive/par2cmdline"
PKG_URL="https://github.com/Parchive/$PKG_NAME/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="par2cmdline: a PAR 2.0 compatible file verification and repair tool"
PKG_AUTORECONF="yes"

post_makeinstall_target() {
  ln -fs $INSTALL/usr/bin/par2 $INSTALL/usr/bin/par2create
  ln -fs $INSTALL/usr/bin/par2 $INSTALL/usr/bin/par2repair
  ln -fs $INSTALL/usr/bin/par2 $INSTALL/usr/bin/par2verify
}
