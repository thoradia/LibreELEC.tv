PKG_NAME="zerotier-one"
PKG_VERSION="1.4.6"
PKG_SHA256="d1a0eeb03acfa446f67adf5901902d17de14b4648c21e160024acf476e3d4fba"
PKG_REV="2"
PKG_LICENSE="BSL1.1"
PKG_SITE="https://www.zerotier.com/"
PKG_URL="https://github.com/zerotier/ZeroTierOne/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+pic"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ZeroTier One"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: easily connect cloud, mobile, desktop, and data center resources anywhere"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) easily connects cloud, mobile, desktop, and data center resources anywhere."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_MAKE_OPTS_TARGET="zerotier-one"

pre_make_target() {
  cd ..
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR ${PKG_BUILD}/zerotier-one \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}
