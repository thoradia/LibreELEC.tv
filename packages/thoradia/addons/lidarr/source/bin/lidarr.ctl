#!/bin/sh
. /etc/profile
oe_setup_addon service.lidarr

export XDG_CONFIG_HOME=${ADDON_HOME}

cert-sync --quiet --user /etc/pki/tls/cacert.pem

exec nice -n "${nice:-10}" \
mono --debug ${ADDON_DIR}/libs/Lidarr.exe -data=${ADDON_HOME} "${@}"
