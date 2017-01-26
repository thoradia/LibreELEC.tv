PKG_NAME="headphones"
PKG_VERSION="0.5.18"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/rembo10/headphones"
PKG_URL="https://github.com/rembo10/$PKG_NAME/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cffi cryptography enum34 pyopenssl"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Headphones"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="8"
PKG_SHORTDESC="$PKG_ADDON_NAME: automated music downloader for NZB and Torrent"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is an automated music downloader for NZB and Torrent. It supports SABnzbd, NZBget, Transmission, µTorrent, Deluge and Blackhole."
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  : nop
}

makeinstall_target() {
  : nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/headphones/libs

  cp -PR $PKG_BUILD/* \
         $ADDON_BUILD/$PKG_ADDON_ID/headphones 

  for d in cffi cryptography enum34 pyopenssl; do
    cp -PR $(get_build_dir $d)/.install_pkg/usr/lib/python*/site-packages/* \
           $ADDON_BUILD/$PKG_ADDON_ID/headphones/libs
  done
}
