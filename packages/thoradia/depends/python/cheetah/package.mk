PKG_NAME="cheetah"
PKG_VERSION="2.4.4"
PKG_LICENSE="MIT"
PKG_SITE="http://www.cheetahtemplate.org/"
PKG_URL="https://files.pythonhosted.org/packages/source/C/Cheetah/Cheetah-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Cheetah-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="Cheetah, the Python-powered templating engine"

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
