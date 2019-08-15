PKG_NAME="aria2"
PKG_VERSION="1.34.0"
PKG_SHA256="bc68bf9a9f192280846e07d25b801c111ea47b9a954cd4deb6f455dbf5191996"
PKG_REV="4"
PKG_LICENSE="OpenSSL"
PKG_SITE="https://aria2.github.io/"
PKG_URL="https://github.com/aria2/$PKG_NAME/archive/release-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-release-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libxml2 openssl sqlite zlib libssh2"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="aria2"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: the next generation download utility"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a lightweight multi-protocol and multi-source command-line download utility, which supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink, and can be manipulated via built-in JSON-RPC and XML-RPC interfaces."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="autotools"
PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --with-libssh2"

makeinstall_target() {
  $STRIP src/aria2c
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/bin"
  cp  "$PKG_BUILD/.$TARGET_NAME/src/aria2c" \
       "$ADDON_BUILD/$PKG_ADDON_ID/bin"
}
