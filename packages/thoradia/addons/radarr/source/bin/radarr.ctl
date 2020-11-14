#!/bin/sh
. /etc/os-release
. /etc/profile
oe_setup_addon service.radarr

download() {
  _dst=${TMPDIR}/Radarr
  _lib=${ADDON_DIR}/libs
  _url="https://radarr.servarr.com/v1/update/nightly/updatefile?os=linux&${1}"
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
    RPi.arm)
      download "runtime=mono"
      use_mono
      ;;
    *.x86_64)
      download "runtime=netcore&arch=x64"
      use_netcore
      ;;
    *)
      download "runtime=netcore&arch=arm"
      use_netcore
      ;;
  esac
}

use_mono() {
  _cmd="mono --debug ${_lib}/Radarr.exe"
  cert-sync --quiet --user /etc/pki/tls/cacert.pem
}

use_netcore() {
  _cmd=${_lib}/Radarr
  chmod +x ${_cmd}
}

export TMPDIR=${ADDON_DIR}
export XDG_CONFIG_HOME="${ADDON_HOME}"
select_runtime
exec nice -n "${nice:-10}" \
${_cmd} -data=${ADDON_HOME} -nobrowser "${@}"
