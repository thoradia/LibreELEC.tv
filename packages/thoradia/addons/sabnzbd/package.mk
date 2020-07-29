PKG_NAME="sabnzbd"
PKG_VERSION="3.0.2"
PKG_SHA256="8dd706e7dc0b880c6566c601555ed16e8ba4d9ac16c8152edce03ad17a9dc1be"
PKG_REV="40"
PKG_LICENSE="GPLv2"
PKG_SITE="https://sabnzbd.org/"
PKG_URL="https://github.com/sabnzbd/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain crossenv:host"
PKG_DEPENDS_TARGET="toolchain sabnzbd:host p7zip par2cmdline unrar"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="SABnzbd"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.locale:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: free and easy binary newsreader"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a program to download binary files from Usenet servers."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

make_host() {
  python3 -m crossenv ${SYSROOT_PREFIX}/usr/bin/python3 .crossenv
  . .crossenv/bin/activate
  build-pip install cffi
}

make_target() {
  rm -fr linux osx win
  python3 -m crossenv ${SYSROOT_PREFIX}/usr/bin/python3 .crossenv
  . .crossenv/bin/activate
  pip install --requirement requirements.txt --target .
  python3 -m compileall *
  find . -name \*.py -type f -exec rm -f {} +
  mkdir -p ${INSTALL}
  cp -r * ${INSTALL}
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR $(get_install_dir p7zip)/usr/bin/* \
           $(get_install_dir par2cmdline)/usr/bin/par2 \
           $(get_install_dir unrar)/usr/bin/unrar \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
