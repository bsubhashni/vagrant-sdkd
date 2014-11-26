#!/usr/bin/env bash

apt-get upgrade
apt-get install -y git
apt-get install -y cmake
chmod 600 /home/vagrant/id_dsa
chmod 600 /home/vagrant/id_dsa.pub

SOURCE_DIR=$(pwd)/sources
mkdir -p $SOURCE_DIR
cd  $SOURCE_DIR

git clone http://github.com/couchbase/libcouchbase.git
LIBCOUCHBASE_DIR=$(pwd)/libcouchbase

git clone git@github.com:couchbase/sdkd-cpp.git
SDKD_CPP_DIR=$(pwd)/sdkd-cpp

git clone git@github.com:couchbaselabs/sdkdclient-ng.git
SDKDCLIENT_NG_DIR=$(pwd)/sdkdclient-ng

cd $LIBCOUCHBASE_DIR
mkdir lcb-build
cd lcb-build
../cmake/configure --prefix=$(PWD)/inst
make;make install

cd $SDKD_CPP_DIR
mkdir build
cd build
cmake -DLCB_ROOT=$LIBCOUCHBASE_DIR/lcb-build/inst -DCMAKE_BUILD_TYPE=DEBUG ../



