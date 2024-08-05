#!/usr/bin/env bash

chroot ../target-rootfs bash -c 'export PS1="(chroot):\w # "; bash --norc'
