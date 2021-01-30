PKG_NAME="nordvpn"
PKG_VERSION="3.8.10"
PKG_REV="15"
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
    PKG_SHA256="f19fd4c5ec6cadde082669eccc23fe9238060f6263e89244a43c04aff7ca3d3c"
    ;;
  x86_64)
    arch="amd64"
    PKG_SHA256="e27ba637dffc766b99161805f525b87716c8d36186d09abea61f6094af87a9fe"
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
    cp -PR $(get_build_dir iproute2)/.install_pkg/sbin/ip \
           $(get_build_dir ipset)/.install_pkg/usr/sbin/ipset \
           $(get_build_dir sysctl)/.${TARGET_NAME}/sysctl \
           $(get_build_dir libxslt)/.${TARGET_NAME}/xsltproc/xsltproc \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bins
}
