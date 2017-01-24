PKG_NAME="pyasn1"
PKG_VERSION="0.1.9"
PKG_LICENSE="BSD"
PKG_SITE="http://pyasn1.sourceforge.net/"
PKG_URL="http://downloads.sourceforge.net/project/$PKG_NAME/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="ASN.1 library for Python"

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
