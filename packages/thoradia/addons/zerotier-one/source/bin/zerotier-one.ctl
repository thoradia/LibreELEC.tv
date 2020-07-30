#!/bin/sh
. /etc/profile
oe_setup_addon service.zerotier-one

ZEROTIER_HOME=${ADDON_HOME} \
exec nice -n "${nice:-10}" \
${ADDON_DIR}/bin/zerotier-one "${@}"
