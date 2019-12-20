PKG_NAME="qt-everywhere"
PKG_VERSION="5.15.0"
PKG_SHA256="22b63d7a7a45183865cc4141124f12b673e7a17b1fe2b91e433f6547c5d548c3"
PKG_LICENSE="GPL"
PKG_SITE="http://qt-project.org"
PKG_URL="http://download.qt.io/archive/qt/5.15/${PKG_VERSION}/single/${PKG_NAME}-src-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain openssl pcre2 zlib"
PKG_LONGDESC="A cross-platform application and UI framework"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="-prefix /usr
                           -sysroot ${SYSROOT_PREFIX}
                           -hostprefix ${TOOLCHAIN}
                           -device linux-libreelec-g++
                           -opensource -confirm-license
                           -release
                           -static
                           -make libs
                           -force-pkg-config
                           -no-accessibility
                           -no-sql-sqlite
                           -no-sql-mysql
                           -system-zlib
                           -no-mtdev
                           -no-gif
                           -no-libjpeg
                           -no-harfbuzz
                           -no-libproxy
                           -system-pcre
                           -no-glib
                           -silent
                           -no-cups
                           -no-iconv
                           -no-evdev
                           -no-tslib
                           -no-icu
                           -no-fontconfig
                           -no-dbus
                           -no-opengl
                           -no-libudev
                           -no-libinput
                           -no-eglfs
                           -skip qt3d
                           -skip qtactiveqt
                           -skip qtandroidextras
                           -skip qtcanvas3d
                           -skip qtcharts
                           -skip qtconnectivity
                           -skip qtdatavis3d
                           -skip qtdeclarative
                           -skip qtdoc
                           -skip qtgamepad
                           -skip qtgraphicaleffects
                           -skip qtimageformats
                           -skip qtlocation
                           -skip qtmacextras
                           -skip qtmultimedia
                           -skip qtnetworkauth
                           -skip qtpurchasing
                           -skip qtquickcontrols
                           -skip qtquickcontrols2
                           -skip qtremoteobjects
                           -skip qtscript
                           -skip qtscxml
                           -skip qtsensors
                           -skip qtserialbus
                           -skip qtspeech
                           -skip qtsvg
                           -skip qttranslations
                           -skip qtvirtualkeyboard
                           -skip qtwayland
                           -skip qtwebchannel
                           -skip qtwebengine
                           -skip qtwebsockets
                           -skip qtwebview
                           -skip qtwinextras
                           -skip qtx11extras
                           -skip qtxmlpatterns"

configure_target() {
  QMAKE_CONF_DIR=qtbase/mkspecs/devices/linux-libreelec-g++
  QMAKE_CONF=${QMAKE_CONF_DIR}/qmake.conf

  cd ..
  mkdir -p ${QMAKE_CONF_DIR}
  echo '#include "../../linux-g++/qplatformdefs.h"' >> ${QMAKE_CONF_DIR}/qplatformdefs.h
  cat > $QMAKE_CONF <<EOF
    MAKEFILE_GENERATOR       = UNIX
    CONFIG                  += incremental
    QMAKE_INCREMENTAL_STYLE  = sublib
    include(../../common/linux.conf)
    include(../../common/gcc-base-unix.conf)
    include(../../common/g++-unix.conf)
    load(device_config)
    QMAKE_CC                = $CC
    QMAKE_CXX               = $CXX
    QMAKE_LINK              = $CXX
    QMAKE_LINK_SHLIB        = $CXX
    QMAKE_AR                = $AR cqs
    QMAKE_OBJCOPY           = $OBJCOPY
    QMAKE_NM                = $NM -P
    QMAKE_STRIP             = ${STRIP}
    QMAKE_CFLAGS            = ${CFLAGS}
    QMAKE_CXXFLAGS          = ${CXXFLAGS}
    QMAKE_LFLAGS            = ${LDFLAGS}
    load(qt_config)
EOF

  unset CC CXX LD RANLIB AR AS CPPFLAGS CFLAGS LDFLAGS CXXFLAGS
  ./configure $PKG_CONFIGURE_OPTS_TARGET
}
