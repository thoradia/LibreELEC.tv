PKG_NAME="rutorrent"
PKG_VERSION="3.10"
PKG_SHA256="dac1e3e0079eb475066d6be738b8372596fa382b074792db5ecab31bce6cfa6d"
PKG_REV="12"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Novik/ruTorrent"
PKG_URL="https://github.com/Novik/ruTorrent/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain mediainfo php unrar"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ruTorrent"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.rtorrent:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: web front-end for rTorrent"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a web front-end for rtorrent designed to emulate the look and feel of µTorrent web user interface."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp $(get_build_dir mediainfo)/Project/GNU/CLI/mediainfo \
       $(get_install_dir php)/usr/bin/php \
       $(get_install_dir unrar)/usr/bin/unrar \
       ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/rutorrent
    cp -R ${PKG_BUILD}/* \
          ${ADDON_BUILD}/${PKG_ADDON_ID}/rutorrent
}
