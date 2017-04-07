PKG_NAME="cffi"
PKG_VERSION="1.10.0"
PKG_LICENSE="MIT"
PKG_SITE="http://cffi.readthedocs.io/"
PKG_URL="https://pypi.python.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7/cffi-1.10.0.tar.gz"
PKG_LONGDESC="Foreign Function Interface for Python calling C code"


PKG_DEPENDS_HOST="toolchain distutilscross:host libffi:host"

make_host() {
  unset _python_exec_prefix _python_prefix _python_sysroot
  mkdir -p .$HOST_NAME
  cp -PR * .$HOST_NAME
  cd .$HOST_NAME
  export LDSHARED="$CC -shared"
  python setup.py build
}

makeinstall_host() {
  python setup.py install --prefix=$ROOT/$TOOLCHAIN
}


PKG_DEPENDS_TARGET="toolchain distutilscross:host Python libffi"

make_target() {
  mkdir -p .$TARGET_NAME
  cp -PR * .$TARGET_NAME
  cd .$TARGET_NAME
  export LDSHARED="$CC -shared"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL  --prefix=/usr
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*.egg-info \
         $INSTALL/usr/lib/python*/site-packages/*/tests
}
