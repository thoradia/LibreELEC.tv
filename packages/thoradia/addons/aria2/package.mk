PKG_NAME="aria2"
PKG_VERSION="1.35.0"
PKG_SHA256="c4072deaf6b443be15f9710657aa6c53527f642bc7a3252bb81d2853161080ed"
PKG_REV="6"
PKG_LICENSE="OpenSSL"
PKG_SITE="https://aria2.github.io/"
PKG_URL="https://github.com/aria2/${PKG_NAME}/archive/release-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libxml2 openssl sqlite zlib libssh2"
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="aria2"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: the next generation download utility"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a lightweight multi-protocol and multi-source command-line download utility, which supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink, and can be manipulated via built-in JSON-RPC and XML-RPC interfaces."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CONFIGURE_OPTS_TARGET="ARIA2_STATIC=yes --with-libssh2"

makeinstall_target() {
  ${STRIP} src/aria2c
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR ${PKG_BUILD}/.${TARGET_NAME}/src/aria2c \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}
