#!/bin/sh
. /etc/profile
oe_setup_addon service.nzbget

[ -e ${ADDON_HOME}/nzbget.conf ] || cp ${ADDON_DIR}/config/nzbget.conf ${ADDON_HOME}

exec nice -n "${nice:-10}" \
nzbget -c ${ADDON_HOME}/nzbget.conf "${@}"
