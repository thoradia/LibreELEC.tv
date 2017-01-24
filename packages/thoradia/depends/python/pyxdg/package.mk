PKG_NAME="pyxdg"
PKG_VERSION="rel-0.25"
PKG_LICENSE="LGPLv2"
PKG_SITE="https://freedesktop.org/wiki/Software/pyxdg/"
PKG_URL="https://github.com/takluyver/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="PyXDG provides Python implementations of various freedesktop.org specifications"

make_target() {
  export LDSHARED="$CC -shared"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  python setup.py build
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*.egg-info \
         $INSTALL/usr/lib/python*/site-packages/*/tests
}
