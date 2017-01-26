PKG_NAME="thoradia"
PKG_SITE="https://github.com/thoradia/thoradia"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Thoradia Add-ons"
PKG_ADDON_TYPE="thoradia.service"
PKG_MAINTAINER="thoradia"
PKG_REV="5"
PKG_SHORTDESC="$PKG_ADDON_NAME: add-on repository"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_REV) add-on repository, provides CouchPotato, Deluge, Headphones, Jackett, NZBGet, Radarr, SABnzbd, SickRage, Sonarr and Transmission."
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  : # nop
}
