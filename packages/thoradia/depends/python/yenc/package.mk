PKG_NAME="yenc"
PKG_VERSION="5162e24"
PKG_LICENSE="LGPL"
PKG_SITE="https://bitbucket.org/dual75/yenc"
PKG_URL="https://bitbucket.org/dual75/$PKG_NAME/get/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="dual75-$PKG_NAME-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_SHORTDESC="par2cmdline: provides raw yEnc encoding/decoding with built-in crc32 calculation"

make_target() {
  export LDSHARED="$CC -shared"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  python setup.py build
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*.egg-info \
         $INSTALL/usr/lib/python*/site-packages/*/tests
}
