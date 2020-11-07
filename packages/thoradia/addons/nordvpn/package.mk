PKG_NAME="nordvpn"
PKG_VERSION="3.8.6"
PKG_REV="11"
PKG_LICENSE="Prop."
PKG_SITE="https://nordvpn.com/"
PKG_DEPENDS_TARGET="toolchain iproute2 ipset libxslt sysctl"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="NordVPN"
PKG_ADDON_TYPE="xbmc.service.script"
PKG_ADDON_PROVIDES="executable"
PKG_MAINTAINER="thoradia"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: protect your privacy online and access media content with no regional restrictions"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) protects your privacy online and access media content with no regional restrictions, strong encryption and no-log policy with 3000+ servers in 60+ countries."
PKG_DISCLAIMER="Keep it legal and carry on"

case ${ARCH} in
  arm)
    arch="armhf"
    PKG_SHA256="3aa68bb0f5209a510bb29ad3cf66e93c42e4846ed28b0bdddae3536e35100326"
    ;;
  x86_64)
    arch="amd64"
    PKG_SHA256="5313a6d2813bc44aed2653ba08a63614a44bb2c568505e5e781d9b4de420c426"
    ;;
esac

PKG_URL="https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${PKG_VERSION}_${arch}.deb"
PKG_SOURCE_NAME=nordvpn_${PKG_VERSION}_${arch}.deb

unpack() {
  :
}

make_target() {
  ar x ${SOURCES}/${PKG_NAME}/${PKG_SOURCE_NAME}
  tar xf data.tar.xz
  echo ${PKG_REV} > var/lib/nordvpn/version
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR ${PKG_BUILD}/usr/bin/nordvpn \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/_nordvpn
    cp -PR ${PKG_BUILD}/usr/sbin/nordvpnd \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR ${PKG_BUILD}/var/lib/nordvpn \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bins
    cp -PR $(get_install_dir iproute2)/sbin/ip \
           $(get_install_dir ipset)/usr/sbin/ipset \
           $(get_build_dir sysctl)/.${TARGET_NAME}/sysctl \
           $(get_build_dir libxslt)/.${TARGET_NAME}/xsltproc/xsltproc \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bins
}
