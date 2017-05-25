PKG_NAME="automat"
PKG_VERSION="0.6.0"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/glyph/automat"
PKG_URL="https://files.pythonhosted.org/packages/source/A/Automat/Automat-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Automat-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="Self-service finite-state machines for the programmer on the go"

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
