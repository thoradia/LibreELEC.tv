#!/bin/sh
. /etc/profile
oe_setup_addon service.rtorrent

PATH="${ADDON_DIR}/../service.rutorrent/bin:${PATH}"

cd ${ADDON_HOME}
mkdir session
cp ${ADDON_DIR}/doc/rtorrent.rc rtorrent.rc.sample
[ -e rtorrent.rc ] || cp rtorrent.rc.sample rtorrent.rc
if ! grep "^[[:blank:]]*network.scgi.open_port" rtorrent.rc; then
  echo "network.scgi.open_port = \"127.0.0.1:${rt_port:-5000}\"" | tee rtorrent.rc
fi

exec nice -n "${nice:-10}" \
rtorrent -n -o import=rtorrent.rc -s ${ADDON_HOME}/session "${@}"
