PKG_NAME="medusa"
PKG_VERSION="0.4.1"
PKG_SHA256="a4047cfad14ea74ae8f61ae8d1e358c0cae41ed939c426450b780fcc33f84b6c"
PKG_REV="8"
PKG_SITE="https://github.com/pymedusa/Medusa"
PKG_URL="https://github.com/pymedusa/Medusa/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain unrar"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Medusa"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.locale:0.0.0 tools.ffmpeg-tools:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: automatic video library manager for TV shows"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) watches for new episodes of your favorite shows, and when they are posted it does its magic."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR $(get_build_dir unrar)/unrar \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
