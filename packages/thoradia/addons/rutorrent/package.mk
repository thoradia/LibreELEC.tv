PKG_NAME="rutorrent"
PKG_VERSION="3.7"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Novik/ruTorrent"
PKG_URL="https://dl.bintray.com/novik65/generic/ruTorrent-$PKG_VERSION.zip"
PKG_SOURCE_DIR="ruTorrent-master"
PKG_DEPENDS_TARGET="toolchain php"
PKG_AUTORECONF="no"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ruTorrent"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.rtorrent:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_REV="2"
PKG_SHORTDESC="$PKG_ADDON_NAME: web front-end for rTorrent"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a web front-end for rtorrent designed to emulate the look and feel of µTorrent web user interface"
PKG_DISCLAIMER="Keep it legal and carry on"

configure_target() {
  :
}

make_target() {
  :
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp $(get_build_dir php)/.install_pkg/usr/bin/php-cgi \
     $ADDON_BUILD/$PKG_ADDON_ID/bin/php

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/rutorrent
  cp -R $PKG_BUILD/* \
        $ADDON_BUILD/$PKG_ADDON_ID/rutorrent

  rm -rf $ADDON_BUILD/$PKG_ADDON_ID/rutorrent/plugins/mediainfo
}
