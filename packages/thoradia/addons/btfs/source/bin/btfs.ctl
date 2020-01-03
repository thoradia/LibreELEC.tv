#!/bin/sh
. /etc/profile
oe_setup_addon tools.btfs

HOME=${ADDON_HOME} \
exec ${ADDON_DIR}/bin/btfs "${@}"
