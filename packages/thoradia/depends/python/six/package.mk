PKG_NAME="six"
PKG_VERSION="1.10.0"
PKG_LICENSE="MIT"
PKG_SITE="http://pypi.python.org/pypi/six/"
PKG_URL="https://bitbucket.org/gutworth/$PKG_NAME/get/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="gutworth-$PKG_NAME-*"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host"
PKG_LONGDESC="Python 2 and 3 compatibility utilities"

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
