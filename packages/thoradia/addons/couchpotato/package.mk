PKG_NAME="couchpotato"
PKG_VERSION="ec42591"
PKG_LICENSE="GPLv3"
PKG_SITE="http://couchpota.to"
PKG_URL="https://github.com/CouchPotato/CouchPotatoServer/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="CouchPotatoServer-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain cffi enum34 lxml pyopenssl six"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="CouchPotato"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="15"
PKG_SHORTDESC="$PKG_ADDON_NAME: automatic movie downloading via Usenet and BitTorrent"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) downloads movies automatically, easily and in the best quality as soon as they are available"
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/CouchPotato

  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/CouchPotato

  for d in cffi cryptography enum34 lxml packaging pyopenssl six; do
    cp -PR $(get_build_dir $d)/.install_pkg/usr/lib/python*/site-packages/* \
           $ADDON_BUILD/$PKG_ADDON_ID/CouchPotato/libs
  done
}
