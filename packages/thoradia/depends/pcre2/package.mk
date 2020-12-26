PKG_NAME="pcre2"
PKG_VERSION="10.36"
PKG_SHA256="a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c"
PKG_LICENSE="BSD"
PKG_SITE="http://www.pcre.org/"
PKG_URL="https://ftp.pcre.org/pub/pcre/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5. PCRE has its own native API, as well as a set of wrapper functions that correspond to the POSIX regular expression API. The PCRE library is free, even for building commercial software."

PKG_BUILD_FLAGS="+pic"
PKG_CMAKE_OPTS_TARGET="-DPCRE2_BUILD_PCRE2_16=ON \
                       -DPCRE2_BUILD_PCRE2GREP=OFF \
                       -DPCRE2_BUILD_TESTS=OFF"
