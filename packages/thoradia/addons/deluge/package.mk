PKG_NAME="deluge"
PKG_VERSION="1.3.13"
PKG_LICENSE="GPLv3"
PKG_SITE="http://deluge-torrent.org/"
PKG_URL="https://github.com/deluge-torrent/deluge/archive/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="deluge-deluge-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain attrs cffi chardet constantly enum34 incremental libtorrent-rasterbar lxml mako pyasn1 pyasn1-modules pyopenssl python-gettext pyxdg service_identity six twisted zope.interface"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Deluge"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="5"
PKG_SHORTDESC="$PKG_NAME: lightweight, free software, cross-platform BitTorrent client"
PKG_SHORTDESC="$PKG_NAME ($PKG_VERSION) is a lightweight, free software, cross-platform BitTorrent client"
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  export LDSHARED="$CC -shared"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  python setup.py build
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*/tests

}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/deluge

  cp -PR $PKG_BUILD/.install_pkg/usr/bin/deluged \
         $PKG_BUILD/.install_pkg/usr/bin/deluge-web \
         $PKG_BUILD/.install_pkg/usr/lib/python*/site-packages/* \
         $SYSROOT_PREFIX/usr/lib/libboost_python.so.* \
         $(get_build_dir setuptools)/build/lib/pkg_resources \
         $ADDON_BUILD/$PKG_ADDON_ID/deluge/

  cp -L $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/libtorrent-rasterbar.so.? \
        $ADDON_BUILD/$PKG_ADDON_ID/deluge/

  for d in attrs cffi chardet constantly cryptography enum34 incremental libtorrent-rasterbar lxml mako pyasn1 pyasn1-modules pyopenssl python-gettext pyxdg service_identity six twisted zope.interface; do
    cp -PR $(get_build_dir $d)/.install_pkg/usr/lib/python*/site-packages/* \
           $ADDON_BUILD/$PKG_ADDON_ID/deluge/
  done
}
