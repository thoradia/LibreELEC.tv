PKG_NAME="twisted"
PKG_VERSION="17.1.0"
PKG_LICENSE="MIT"
PKG_SITE="http://twistedmatrix.com/trac/"
PKG_URL="https://github.com/twisted/$PKG_NAME/archive/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="twisted-$PKG_NAME-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="Twisted is an event-driven networking engine"

make_target() {
  export LDSHARED="$CC -shared"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*.egg-info \
         $INSTALL/usr/lib/python*/site-packages/*/tests
}
