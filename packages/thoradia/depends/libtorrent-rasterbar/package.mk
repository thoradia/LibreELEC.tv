PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="2.0.0"
PKG_SHA256="33d802ea35bbc13daa70dc621c15553a0b7393961e29c9211fc239de821d4e98"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/releases/download/2.0/libtorrent-rasterbar-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost openssl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"

PKG_BUILD_FLAGS="+pic"
PKG_CMAKE_OPTS_TARGET="-Dboost-python-module-name=python \
                       -DBoost_USE_STATIC_LIBS=ON \
                       -DBUILD_SHARED_LIBS=OFF \
                       -Dpython-bindings=ON"
