PKG_NAME="transmission"
PKG_VERSION="2.92"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission-releases/raw/master/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain curl libevent libressl zlib"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Transmission"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="8"
PKG_SHORTDESC="$PKG_ADDON_NAME: a fast, easy and free BitTorrent client"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a fast, easy and free BitTorrent client"
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CONFIGURE_OPTS_TARGET="--enable-daemon      \
                           --enable-utp         \
                           --disable-nls        \
                           --with-gnu-ld"

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp $PKG_BUILD/.$TARGET_NAME/daemon/transmission-daemon \
     $PKG_BUILD/.$TARGET_NAME/daemon/transmission-remote \
     $ADDON_BUILD/$PKG_ADDON_ID/bin

  cp -PR $PKG_BUILD/web $ADDON_BUILD/$PKG_ADDON_ID
  rm -fr $ADDON_BUILD/$PKG_ADDON_ID/web/LICENSE
  find $ADDON_BUILD/$PKG_ADDON_ID/web -name "Makefile*" -delete
}
