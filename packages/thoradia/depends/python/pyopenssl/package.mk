PKG_NAME="pyopenssl"
PKG_VERSION="16.2.0"
PKG_LICENSE="ASLv2"
PKG_SITE="https://pyopenssl.readthedocs.io/en/stable/"
PKG_URL="https://github.com/pyca/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python cryptography"
PKG_LONGDESC="A Python wrapper around the OpenSSL library"

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
