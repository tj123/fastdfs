#!/bin/env bash

version="5.0.12"
project="fastdfs"
spec=$project.spec

./make.sh clean
rm -rf ~/rpmbuild
mkdir -pv ~/rpmbuild/{SOURCES,SPECS}
tar zcvf ~/rpmbuild/SOURCES/$project-$version.tar.gz ./ --exclude-vcs --transform=s/^\\./$project-$version/
cp ./$spec ~/rpmbuild/SPECS/
rpmbuild -bb ~/rpmbuild/SPECS/$spec