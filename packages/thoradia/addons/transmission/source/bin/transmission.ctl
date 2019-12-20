#!/bin/sh
. /etc/profile
oe_setup_addon service.transmission

sysctl -w net.core.rmem_max=4194304
sysctl -w net.core.wmem_max=1048576

EVENT_NOEPOLL=1 \
TRANSMISSION_WEB_HOME=${ADDON_DIR}/web \
exec nice -n "${nice:-10}" \
transmission-daemon --config-dir ${ADDON_HOME} "${@}"
