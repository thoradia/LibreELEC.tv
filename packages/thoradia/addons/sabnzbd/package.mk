PKG_NAME="sabnzbd"
PKG_VERSION="1.1.1"
PKG_LICENSE="GPLv2"
PKG_SITE="https://sabnzbd.org/"
PKG_URL="https://github.com/sabnzbd/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain setuptools:host cheetah cffi cryptography enum34 par2cmdline p7zip py-notify pyopenssl unrar yenc"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="SABnzbd"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="6"
PKG_SHORTDESC="$PKG_ADDON_NAME: free and easy binary newsreader"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a program to download binary files from Usenet servers."
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin \
           $ADDON_BUILD/$PKG_ADDON_ID/SABnzbd

  cp -PR $(get_build_dir p7zip)/bin/* \
         $(get_build_dir par2cmdline)/.install_pkg/usr/bin/par2 \
         $(get_build_dir unrar)/unrar \
         $ADDON_BUILD/$PKG_ADDON_ID/bin/

  cp -PR $PKG_BUILD/* \
         $(get_build_dir setuptools)/build/lib/pkg_resources \
         $ADDON_BUILD/$PKG_ADDON_ID/SABnzbd/

  for d in cheetah cffi cryptography enum34 py-notify pyopenssl yenc; do
    cp -PR $(get_build_dir $d)/.install_pkg/usr/lib/python*/site-packages/* \
           $ADDON_BUILD/$PKG_ADDON_ID/SABnzbd/
  done
}
