#!/usr/bin/env bash

PACKAGE=$1

mkdir -p temp_packages
cd temp_packages

echo "+++ Package depends on:"

apt show $PACKAGE 2>/dev/null | grep -i depends

echo ""
echo "+++ Package contents:"

apt download $PACKAGE 2>/dev/null

dpkg-deb -c $PACKAGE*
