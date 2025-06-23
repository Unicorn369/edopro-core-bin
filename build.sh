#!/usr/bin/env sh
git clone --depth=1 https://github.com/edo9300/ygopro-core
cd ygopro-core
premake5 gmake
cd build
#wget -O tools.tar.xz https://github.com/Unicorn369/ygoserver/releases/download/v0.0.1/linux-musl-tools.tar.xz
export PATH=$PATH:/opt/linux-musl-tools/bin
#export CHOST=arm-linux-musleabihf
#export CHOST=aarch64-linux-musl
export CHOST=x86_64-linux-musl
export AR=$CHOST-ar
export CC=$CHOST-cc
export CXX=$CHOST-c++
export LD=$CHOST-ld
export STRIP=$CHOST-strip
rm -rf ../obj
make config=release ocgcoreshared -j4
$STRIP ../bin/release/libocgcore.so