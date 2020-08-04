. /etc/profile
oe_setup_addon service.nordvpn

chmod +x ${ADDON_DIR}/bins/*
export PATH=${ADDON_DIR}/bins:${PATH}

vd=$(cat ${ADDON_DIR}/nordvpn/version)
vh=$(cat ${ADDON_HOME}/nordvpn/version)

if [ "${vd}" != "${vh}" ]; then
  echo "updating /var/lib/openvpn from ${vh:-none} to ${vd}"
  chmod +x ${ADDON_DIR}/nordvpn/openvpn
  mkdir -p ${ADDON_HOME}/nordvpn
  cp -r ${ADDON_DIR}/nordvpn/* ${ADDON_HOME}/nordvpn
fi

ln -fs ${ADDON_HOME}/nordvpn /var/lib/nordvpn

exec nice -n "${nice:-10}" \
${ADDON_DIR}/bin/nordvpnd "${@}"
