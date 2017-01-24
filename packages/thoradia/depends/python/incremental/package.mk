PKG_NAME="incremental"
PKG_VERSION="16.10.1"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/hawkowl/incremental"
PKG_URL="https://github.com/hawkowl/$PKG_NAME/archive/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="incremental-$PKG_NAME-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="A library for versioning your Python projects"

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
