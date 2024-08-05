#!/usr/bin/env bash

CHISEL_RELEASES_LOCATION=$HOME/Development/chisel-releases
CHISELED_ROOTFS=$HOME/Development/target-rootfs

mkdir -p $CHISELED_ROOTFS
echo "Cleaning up old filesystem"
rm -rf $CHISELED_ROOTFS/*


chisel cut --release $CHISEL_RELEASES_LOCATION \
	--root $CHISELED_ROOTFS \
	libc6_libs \
	ca-certificates_data \
	bash_bins \
	base-files_base \
	coreutils_bins \
	libexif12_libs \
	libgif7_libs \
	libpixman-1-0_libs \
	libfontconfig1_libs \
	libxcb1_libs


cp /usr/bin/ldd $CHISELED_ROOTFS/usr/bin

mkdir $CHISELED_ROOTFS/dev
touch $CHISELED_ROOTFS/dev/null
