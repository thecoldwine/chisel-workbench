#!/usr/bin/env bash

package=$1

cat << EOF >> ../chisel-releases/slices/$package.yaml
package: libblkid

essential:
  - libblkid_copyright

slices:
  libs:
    essential:
      - libc6_libs
    contents:
      /usr/lib/*-linux-*/libblkid.so.1*:

  copyright:
    contents:
      /usr/share/doc/libblkid/copyright:
EOF


sed -i "s/libblkid/$package/g" ../chisel-releases/slices/$package.yaml
