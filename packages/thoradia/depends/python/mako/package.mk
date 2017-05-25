PKG_NAME="mako"
PKG_VERSION="1.0.6"
PKG_LICENSE="MIT"
PKG_SITE="http://www.makotemplates.org/"
PKG_URL="https://files.pythonhosted.org/packages/source/M/Mako/Mako-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Mako-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="Mako templates for Python"

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
