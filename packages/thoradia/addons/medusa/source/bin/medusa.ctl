#!/bin/sh
. /etc/profile
oe_setup_addon service.medusa

exec nice -n "${nice:-10}" \
python ${ADDON_DIR}/libs/start.py --datadir=${ADDON_HOME} "${@}"
