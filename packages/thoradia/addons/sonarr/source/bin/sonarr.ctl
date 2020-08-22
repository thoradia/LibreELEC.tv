#!/bin/sh
. /etc/os-release
. /etc/profile
oe_setup_addon service.sonarr

download() {
  _dst=${TMPDIR}/Sonarr
  _lib=${ADDON_DIR}/libs
  _url="https://services.sonarr.tv/v1/download/phantom-develop/latest?version=3&os=linux"
  if [ -e ${_lib} ]; then
    return
  fi
  rm -fr ${_dst}
  set -o pipefail
  if ! wget -qO- ${_url} | tar vxzf - -C ${TMPDIR}; then
    exit 1
  fi
  mv ${_dst} ${_lib}
}

select_runtime() {
  case ${LIBREELEC_ARCH} in
    *)
      download
      use_mono
      ;;
  esac
}

use_mono() {
  _cmd="mono --debug ${ADDON_DIR}/libs/Sonarr.exe -data=${ADDON_HOME}"
  cert-sync --quiet --user /etc/pki/tls/cacert.pem
}

use_netcore() {
  export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
}

export TMPDIR=${ADDON_DIR}
export XDG_CONFIG_HOME=${ADDON_HOME}
select_runtime
exec nice -n "${nice:-10}" \
${_cmd} "${@}"
