PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="2.0.1"
PKG_SHA256="7b39599bf602bf2f208f8f05bf2327576356a3c192175b3a4603262ede42ffd7"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/releases/download/v${PKG_VERSION}/libtorrent-rasterbar-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost openssl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"

PKG_BUILD_FLAGS="+pic"
PKG_CMAKE_OPTS_TARGET="-Dboost-python-module-name=python \
                       -DBoost_USE_STATIC_LIBS=ON \
                       -DBUILD_SHARED_LIBS=OFF \
                       -Dpython-bindings=ON"
