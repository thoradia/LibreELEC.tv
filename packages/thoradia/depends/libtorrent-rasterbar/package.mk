PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1.2.9"
PKG_SHA256="6c986225a1c2d9eb23c5b1ac0692d83208b721a05c968102a17ee3fde01bd709"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/releases/download/libtorrent-${PKG_VERSION}/libtorrent-rasterbar-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost libiconv openssl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"

PKG_BUILD_FLAGS="+pic"
PKG_CMAKE_OPTS_TARGET="-Dboost-python-module-name=python \
                       -DBoost_USE_STATIC_LIBS=ON \
                       -DBUILD_SHARED_LIBS=OFF \
                       -Dpython-bindings=ON \
                       -DCMAKE_CXX_STANDARD=14"
