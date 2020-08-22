#!/bin/sh
. /etc/os-release
. /etc/profile
oe_setup_addon service.jackett

download() {
  _dst=${TMPDIR}/Jackett
  _lib=${ADDON_DIR}/libs
  _url=https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.${1}.tar.gz
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
      download Mono
      use_mono
      ;;
    *.x86_64)
      download LinuxAMDx64
      use_netcore
      ;;
    *)
      download LinuxARM32
      use_netcore
      ;;
  esac
}

use_mono() {
  _cmd="mono --debug ${_lib}/JackettConsole.exe"
  cert-sync --quiet --user /etc/pki/tls/cacert.pem
}

use_netcore() {
  _cmd=${_lib}/jackett
  chmod +x ${_cmd}
  export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
}

export TMPDIR=${ADDON_DIR}
export XDG_CONFIG_HOME=${ADDON_HOME}
select_runtime
nice -n "${nice:-10}" \
${_cmd} "${@}"

while pgrep JackettUpdater > /dev/null; do
  sleep 1
done
