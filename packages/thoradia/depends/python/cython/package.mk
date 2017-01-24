PKG_NAME="cython"
PKG_VERSION="0.25.2"
PKG_LICENSE="ASL"
PKG_SITE="http://cython.org/"
PKG_URL="https://pypi.python.org/packages/b7/67/7e2a817f9e9c773ee3995c1e15204f5d01c8da71882016cac10342ef031b/Cython-0.25.2.tar.gz"
PKG_SOURCE_DIR="Cython-$PKG_VERSION"
PKG_DEPENDS_HOST="toolchain distutilscross:host"
PKG_LONGDESC="The Cython compiler for writing C extensions for the Python language"

make_host() {
  unset _python_exec_prefix _python_prefix _python_sysroot
  mkdir -p .$HOST_NAME
  cp -PR * .$HOST_NAME
  cd .$HOST_NAME
  export LDSHARED="$CC -shared"
  python setup.py build
}

makeinstall_host() {
  python setup.py install --prefix="$ROOT/$TOOLCHAIN"
}
