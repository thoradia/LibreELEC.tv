#!/bin/sh
. /etc/profile
oe_setup_addon service.deluge

[ -f ${ADDON_HOME}/init.sh ] && sh ${ADDON_HOME}/init.sh

PYTHONPATH=${ADDON_DIR}/libs \
exec nice -n "${nice:-10}" \
python ${ADDON_DIR}/libs/bin/deluged -c ${ADDON_HOME} "${@}"
