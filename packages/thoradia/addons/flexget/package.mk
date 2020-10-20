PKG_NAME="flexget"
PKG_VERSION="3.1.78"
PKG_REV="17"
PKG_LICENSE="MIT"
PKG_SITE="https://flexget.com"
PKG_DEPENDS_TARGET="toolchain crossenv:host libyaml"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="FlexGet"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: automate downloading or processing content from different sources"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a program aimed to automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

pre_configure_target() {
  cat >>requirements.txt <<EOF
deluge-client
mechanize
python-telegram-bot
transmissionrpc
EOF
}

make_target() {
  python3 -m crossenv ${SYSROOT_PREFIX}/usr/bin/python3 .crossenv
  . .crossenv/bin/activate
  pip install --no-compile --target=${INSTALL} flexget==${PKG_VERSION}
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_INSTALL}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
