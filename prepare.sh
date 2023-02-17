#/bin/bash

cd "$(dirname "$0")"

# make kernel image
make $@

# get kernel version from generated/utsrelease.h
RELEASE=`awk 'END {print $NF}' include/generated/utsrelease.h`
RELEASE=${RELEASE:1:-1}
HEADER_DIR="linux-headers-$RELEASE"
echo $RELEASE $HEADER_DIR


# copy and clean source file
mkdir -p $HEADER_DIR
rsync -au --delete --exclude="$HEADER_DIR" --exclude="*.cmd" --exclude="*.dtb" --exclude="*.a" --exclude="*.ko" --exclude="*.o" --exclude="build.sh". $HEADER_DIR
cd $HEADER_DIR 
make mrproper
cp ../.config .

# make modules_prepare
make $@ modules_prepare

# copy Module.symvers
cp ../Module.symvers .

