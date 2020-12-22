#!/bin/sh
. /etc/profile
oe_setup_addon service.nordvpn

chmod +x ${ADDON_DIR}/bins/* ${ADDON_DIR}/nordvpn/openvpn
ln -fs ${ADDON_HOME}/nordvpn /var/lib/nordvpn

vd=$(cat ${ADDON_DIR}/nordvpn/version)
vh=$(cat ${ADDON_HOME}/nordvpn/version)
if [ "${vd}" != "${vh}" ]; then
  echo "updating /var/lib/nordvpn from ${vh:-none} to ${vd}"
  mkdir -p ${ADDON_HOME}/nordvpn
  cp -r ${ADDON_DIR}/nordvpn/* ${ADDON_HOME}/nordvpn
fi

rm -fr /run/nordvpn/nordvpnd.sock
mkdir -p /run/nordvpn

HOME=${ADDON_HOME} \
PATH=${ADDON_DIR}/bins:${PATH} \
exec nice -n "${nice:-10}" \
${ADDON_DIR}/bin/nordvpnd "${@}"
