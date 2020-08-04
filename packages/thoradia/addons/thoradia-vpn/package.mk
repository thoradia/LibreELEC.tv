PKG_NAME="thoradia-vpn"
PKG_VERSION="4"
PKG_REV="${PKG_VERSION}"
PKG_LICENSE="GPLv2"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Thoradia VPN Network Interface"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a virtual private network interface"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) provides the thoradia-vpn network interface to which applications can bind. The system continues using unmodified network configuration whereas applications bound to the thoradia-vpn network interface connect to the VPN. ${PKG_ADDON_NAME} is compatible with VPN Manager for OpenVPN."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  :
}
