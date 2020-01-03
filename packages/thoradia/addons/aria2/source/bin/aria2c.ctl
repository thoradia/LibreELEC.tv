#!/bin/sh
. /etc/profile
oe_setup_addon service.aria2

HOME=${ADDON_HOME} \
exec nice -n "${nice:-10}" \
${ADDON_DIR}/bin/aria2c --conf-path=${ADDON_HOME}/aria2.conf "${@}"
