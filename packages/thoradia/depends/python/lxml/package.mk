PKG_NAME="lxml"
PKG_VERSION="3.7.3"
PKG_LICENSE="BSD"
PKG_SITE="http://lxml.de/"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="lxml-$PKG_NAME-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain cython:host libxslt:host Python libxml2 libxslt"
PKG_LONGDESC="The lxml XML toolkit for Python"

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
