#!/bin/sh
. /etc/profile
oe_setup_addon service.bazarr

GIT_PYTHON_REFRESH=quiet \
PYTHONPATH=${ADDON_DIR}/libs \
exec nice -n "${nice:-10}" \
python ${ADDON_DIR}/libs/bazarr.py --config ${ADDON_HOME} --no-update "${@}"
