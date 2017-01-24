PKG_NAME="py-notify"
PKG_VERSION="0.3.1"
PKG_LICENSE="LGPLv2.1"
PKG_SITE="http://home.gna.org/py-notify/"
PKG_URL="http://download.gna.org/py-notify/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="py-notify: provides tools for implementing Observer programming pattern"

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
