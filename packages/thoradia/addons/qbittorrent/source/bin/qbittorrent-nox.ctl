#!/bin/sh
. /etc/profile
oe_setup_addon service.qbittorrent

HOME="${ADDON_HOME}" \
exec nice -n "${nice:-10}" \
qbittorrent-nox "${@}" << EOF
y
EOF
