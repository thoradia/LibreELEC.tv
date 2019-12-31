PKG_NAME="libmediainfo-shared"
PKG_VERSION="20.08"
PKG_SHA256="e52f1acb520bb6f3af891512d2ac91536a093ced5ecf04b204bb9a1314c0589c"
PKG_LICENSE="GPL"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="https://github.com/MediaArea/MediaInfoLib/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libzen zlib"
PKG_DEPENDS_CONFIG="libzen"
PKG_LONGDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"
PKG_TOOLCHAIN="manual"

configure_target() {
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
