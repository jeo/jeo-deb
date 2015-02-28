#!/bin/bash

set -x
set -e

ver=0.5
zip=jeo-$ver-cli.zip
gdal_tgz=gdaljni-1.11.1-linux64.tgz

url=https://github.com/jeo/jeo-cli/releases/download/$ver/$zip
gdal_url=https://github.com/jeo/jeo-cli/releases/download/$ver/$gdal_tgz

if [ -e $zip ]; then
  rm $zip
fi
if [ -e $gdal_tgz ]; then
  rm $gdal_tgz
fi

if [ -e tmp ]; then
  rm -rf tmp 
fi

rm -rf LICENSE.md *.txt bin lib ext jni

if [ "$1" == "clean" ]; then
  exit
fi

wget $url
unzip -d tmp $zip
pushd tmp/jeo-$ver
mv * ../../
popd

wget $gdal_url
mkdir jni
tar xzvf $gdal_tgz -C jni

debuild clean
debuild -uc -us -b -i
