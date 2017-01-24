PKG_NAME="zope.interface"
PKG_VERSION="4.3.2"
PKG_LICENSE="ZPLv2.1"
PKG_SITE="http://zopeinterface.readthedocs.io/"
PKG_URL="https://github.com/zopefoundation/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="Interfaces for Python"

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
  touch $INSTALL/usr/lib/python2.7/site-packages/zope/__init__.py
}
