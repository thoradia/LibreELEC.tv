PKG_NAME="radarr"
PKG_VERSION="bootstrap"
PKG_REV="33"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Radarr/Radarr"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Radarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="virtual.thoradia-mono:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a fork of Sonarr to work with movies à la CouchPotato"
PKG_LONGDESC="${PKG_ADDON_NAME} is a fork of Sonarr to work with movies à la CouchPotato."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

if [ "${DEVICE}" == "RPi" ]; then
  PKG_ADDON_REQUIRES="tools.mono:0.0.0 ${PKG_ADDON_REQUIRES}"
fi

addon() {
  :
}
