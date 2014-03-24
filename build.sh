#!/bin/bash

set -x
set -e

ver=0.3
zip=jeo-$ver-cli.zip
url=http://ares.boundlessgeo.com/jeo/release/$ver/$zip

if [ -e $zip ]; then
  rm $zip
fi

wget http://ares.boundlessgeo.com/jeo/release/$ver/$zip

if [ -e tmp ]; then
  rm -rf tmp 
fi

rm -rf *.txt bin lib 

if [ "$1" == "clean" ]; then
  exit
fi

wget $url
unzip -d tmp $zip
pushd tmp/jeo-$ver
mv * ../../
popd

debuild clean
debuild -uc -us -b -i
