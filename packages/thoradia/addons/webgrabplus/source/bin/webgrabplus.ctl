#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

. /etc/profile
oe_setup_addon service.webgrabplus

wgp_user () {
  if [ -f ${1} ]; then
    echo "Calling user defined script ${1}"
    sh ${1}
  fi
}

cd ${ADDON_HOME}

url_ver="http://www.webgrabplus.com/sites/default/files/download/ini/latest_version.txt"
url_zip="http://webgrabplus.com/sites/default/files/download/ini/SiteIniPack_current.zip"

mkdir -p siteini.pack siteini.user
touch siteini.version
version="$(wget ${url_ver} -qO -)"
if [ "$(cat siteini.version)" != "${version}" ]; then
  rm -fr siteini.tmp
  mkdir siteini.tmp
  wget ${url_zip} -qP siteini.tmp && \
  unzip -q siteini.tmp/*.zip -d siteini.tmp && \
  rm -fr siteini.pack && \
  mv siteini.tmp/siteini.pack . && \
  echo "${version}" > siteini.version && \
  echo "Updated siteini.pack to ${version}"
  rm -fr siteini.tmp
fi

for f in mdb/mdb.config.xml rex/rex.config.xml ./WebGrab++.config.xml; do
  if [ ! -f ${f} ]; then
    mkdir -p $(dirname ${f})
    cp ${ADDON_DIR}/config/${f} ${f}
  fi
done

export XDG_CONFIG_HOME=${ADDON_HOME}

cert-sync --quiet --user /etc/pki/tls/cacert.pem
wgp_user ${ADDON_HOME}/before.sh
mono ${ADDON_DIR}/bin/WebGrab+Plus.exe ${ADDON_HOME}
wgp_user ${ADDON_HOME}/after.sh
