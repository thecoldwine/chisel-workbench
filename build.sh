#!/usr/bin/env bash

CHISEL_RELEASES_LOCATION=$HOME/Development/chisel-releases
CHISELED_ROOTFS=$HOME/Development/target-rootfs

mkdir -p $CHISELED_ROOTFS
echo "Cleaning up old filesystem"
rm -rf $CHISELED_ROOTFS/*


 chisel cut --release $CHISEL_RELEASES_LOCATION \
 	--root $CHISELED_ROOTFS \
 	bash_bins \
 	coreutils_bins \
 	findutils_bins \
         liblerc4_libs \
 	libgdiplus_libs
#chisel cut --release $CHISEL_RELEASES_LOCATION \
#	--root $CHISELED_ROOTFS \
#	libgdiplus_libs


#mkdir $CHISELED_ROOTFS/dev
#touch $CHISELED_ROOTFS/dev/null
