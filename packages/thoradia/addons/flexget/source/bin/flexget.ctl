#!/bin/sh
. /etc/profile
oe_setup_addon service.flexget

[ -e ${ADDON_HOME}/config.yml ] || cp ${ADDON_DIR}/config/config.yml ${ADDON_HOME}

PYTHONPATH=${ADDON_DIR}/libs \
exec nice -n "${nice:-10}" \
python ${ADDON_DIR}/libs/bin/flexget -c ${ADDON_HOME}/config.yml "${@}"
