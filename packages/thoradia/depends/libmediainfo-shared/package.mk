PKG_NAME="libmediainfo-shared"
PKG_VERSION="20.09"
PKG_SHA256="698b27125d0a20a0e2b1f7e6a4d3e80af4c2c21cf1d320d6cd544fb4f3441904"
PKG_LICENSE="GPL"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="https://github.com/MediaArea/MediaInfoLib/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libzen zlib"
PKG_LONGDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"
PKG_TOOLCHAIN="manual"

configure_target() {
  CXXFLAGS="${CXXFLAGS} -lpthread -lzen"
  cd Project/GNU/Library
    do_autoreconf
    ./configure \
          --host=${TARGET_NAME} \
          --build=${HOST_NAME} \
          --disable-static \
          --enable-shared \
          --prefix=/usr \
          --enable-visibility
}

make_target() {
    make
}
