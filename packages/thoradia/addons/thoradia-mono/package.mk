PKG_NAME="thoradia-mono"
PKG_REV="17"
PKG_DEPENDS_TARGET="toolchain icu libmediainfo-shared"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Thoradia .Net and Mono Tools"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_SECTION="virtual"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a bundle of tools required by .Net and Mono add-ons"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_REV}) includes the ICU and MediaInfo shared libraries."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/lib
    cp -L $(get_install_dir icu)/usr/lib/lib*.so.?? \
          $(get_build_dir libmediainfo-shared)/Project/GNU/Library/.libs/libmediainfo.so.0 \
          ${ADDON_BUILD}/${PKG_ADDON_ID}/lib/
}
