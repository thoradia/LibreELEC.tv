PKG_NAME="flexget"
PKG_VERSION="2.12.7"
PKG_SHA256="7cc26ac06dcc77f036e27f62b56dde6446bb2dc87b60575482c2f34ec985ea13"
PKG_REV="5"
PKG_SITE="https://flexget.com"
PKG_URL="https://github.com/Flexget/Flexget/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Flexget-$PKG_VERSION"
PKG_DEPENDS_TARGET="libyaml"
PKG_SECTION="service"
PKG_TOOLCHAIN="python2"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="FlexGet"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: automate downloading or processing content from different sources"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a program aimed to automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."
PKG_DISCLAIMER="Keep it legal and carry on"

pre_make_target() {
  echo "mechanize==0.3.6" >> requirements.txt
  echo "setuptools==38.5.1" >> requirements.txt
  echo "transmissionrpc==0.11" >> requirements.txt
}

post_makeinstall_target() {
  cp -PR "$(get_build_dir Python)/Lib/lib2to3" \
         "$INSTALL/usr/lib/python2.7/site-packages"

  rm -fr "$INSTALL/usr/lib/python2.7/site-packages"/FlexGet*.egg/flexget/plugins
  cp -PR "$PKG_BUILD/flexget/plugins" \
         "$INSTALL/usr/lib/python2.7/site-packages"/FlexGet*.egg/flexget
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/bin"

  cp -PR "$PKG_BUILD/.install_pkg/usr/lib" \
         "$ADDON_BUILD/$PKG_ADDON_ID"
}