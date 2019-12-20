PKG_NAME="libevent"
PKG_VERSION="2.1.12-stable"
PKG_SHA256="7180a979aaa7000e1264da484f712d403fcf7679b1e9212c4e3d09f5c93efc24"
PKG_LICENSE="BSD"
PKG_SITE="http://libevent.org/"
PKG_URL="https://github.com/libevent/${PKG_NAME}/archive/release-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl zlib"
PKG_LONGDESC="libevent: a library for asynchronous event notification"

PKG_CMAKE_OPTS_TARGET="-DEVENT__DISABLE_BENCHMARK=ON \
                       -DEVENT__DISABLE_DEBUG_MODE=ON \
                       -DEVENT__DISABLE_REGRESS=ON \
                       -DEVENT__DISABLE_SAMPLES=ON \
                       -DEVENT__DISABLE_TESTS=ON \
                       -DEVENT__LIBRARY_TYPE=STATIC"
