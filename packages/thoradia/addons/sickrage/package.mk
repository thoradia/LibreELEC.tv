PKG_NAME="sickrage"
PKG_VERSION="2017.03.08-1"
PKG_LICENSE="GPLv3"
PKG_SITE="https://sickrage.github.io/"
PKG_URL="https://github.com/SickRage/SickRage/archive/v$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="SickRage-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain cffi enum34 lxml pyopenssl"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="SickRage"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="11"
PKG_SHORTDESC="$PKG_ADDON_NAME: automatic video library manager for TV shows"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) watches for new episodes of your favorite shows, and when they are posted it does its magic"
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  : nop
}

makeinstall_target() {
  : nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/SickRage

  cp -PR $PKG_BUILD/* \
         $ADDON_BUILD/$PKG_ADDON_ID/SickRage/

  for d in cffi cryptography enum34 lxml pyopenssl; do
    cp -PR $(get_build_dir $d)/.install_pkg/usr/lib/python*/site-packages/* \
           $ADDON_BUILD/$PKG_ADDON_ID/SickRage/
  done
}
