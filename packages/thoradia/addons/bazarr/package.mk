PKG_NAME="bazarr"
PKG_VERSION="0.9.0.5"
PKG_SHA256="a5351d52c429decc4c52c0e93848fde1f432ffb91309ec4e9688b838e1c3a8d6"
PKG_REV="20"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/morpheus65535/bazarr"
PKG_URL="https://github.com/morpheus65535/bazarr/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain crossenv:host libxslt unrar"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Bazarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.locale:0.0.0 tools.ffmpeg-tools:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: subtitles for Sonarr and Radarr"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a companion application to Sonarr and Radarr. It manages and downloads subtitles based on your requirements. You define your preferences by TV show or movies and Bazarr takes care of everything for you. "
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

pre_configure_target() {
  export PATH="${SYSROOT_PREFIX}/usr/bin:$PATH"
}

make_target() {
  rm -fr bin screenshot
  python -m crossenv ${SYSROOT_PREFIX}/usr/bin/python3 .crossenv
  . .crossenv/bin/activate
  pip install --target=libs lxml numpy
  python_compile ./libs
  mkdir -p ${INSTALL}
  cp -r * ${INSTALL}
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR $(get_install_dir unrar)/usr/bin/unrar \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin


  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_INSTALL}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
