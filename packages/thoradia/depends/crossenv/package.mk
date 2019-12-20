PKG_NAME="crossenv"
PKG_VERSION="0.7"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/benfogle/crossenv"
PKG_DEPENDS_HOST="toolchain Python3"
PKG_LONGDESC="Virtual environments for cross-compiling Python extension modules"
PKG_TOOLCHAIN="manual"

make_host() {
    python3 -m pip install crossenv==${PKG_VERSION}
}
