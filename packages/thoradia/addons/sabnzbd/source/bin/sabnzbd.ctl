#!/bin/sh
. /etc/profile
oe_setup_addon service.sabnzbd

PYTHONPATH=${ADDON_DIR}/libs \
exec nice -n "${nice:-10}" \
python ${ADDON_DIR}/libs/SABnzbd.pyc --config-file $ADDON_HOME "${@}"
