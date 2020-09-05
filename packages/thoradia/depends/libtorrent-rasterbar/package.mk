PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1.2.10"
PKG_SHA256="d0dd30bdc3926587c4241f4068d8e39628a6c1f9f6cf53195f0e9bc90017befb"
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
