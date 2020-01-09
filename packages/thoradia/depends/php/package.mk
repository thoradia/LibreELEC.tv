PKG_NAME="php"
PKG_VERSION="7.4.8"
PKG_SHA256="642843890b732e8af01cb661e823ae01472af1402f211c83009c9b3abd073245"
PKG_LICENSE="PHP"
PKG_SITE="http://www.php.net"
PKG_URL="http://www.php.net/distributions/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain curl oniguruma pcre"
PKG_LONGDESC="The PHP Interpreter"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-all \
                           --disable-cli \
                           --disable-phpdbg \
                           --enable-cgi \
                           --enable-json \
                           --enable-mbstring \
                           --with-curl=${SYSROOT_PREFIX}/usr \
                           --with-openssl=${SYSROOT_PREFIX}/usr \
                           --with-pcre-regex \
                           --with-zlib=${SYSROOT_PREFIX}/usr"

pre_configure_target() {
  export CFLAGS="${CFLAGS} -pthread"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp sapi/cgi/php-cgi ${INSTALL}/usr/bin/php
}
