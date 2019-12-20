PKG_NAME="pcre2"
PKG_VERSION="10.35"
PKG_SHA256="9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613"
PKG_LICENSE="BSD"
PKG_SITE="http://www.pcre.org/"
PKG_URL="https://ftp.pcre.org/pub/pcre/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5. PCRE has its own native API, as well as a set of wrapper functions that correspond to the POSIX regular expression API. The PCRE library is free, even for building commercial software."

PKG_BUILD_FLAGS="+pic"
PKG_CMAKE_OPTS_TARGET="-DPCRE2_BUILD_PCRE2_16=ON \
                       -DPCRE2_BUILD_PCRE2GREP=OFF \
                       -DPCRE2_BUILD_TESTS=OFF"
