#!/bin/bash

# $SRCDIR
#    README
#    INSTALL
#    build.sh
#    CMakeLists.txt
#    config.h.cmake
#    indi_rolloffino.xml.cmake
#    rolloffino.cpp
#    rolloffino.h    
#    rolloff.ino.standard
#    rolloff.ino.ar1450
#    rolloff.ino.boutons

# build.sh
# Prerequisites   
#   general build software git cmake c++ compiler etc.
#   libindi-dev (libindi-devel), libnova-dev installed
#
# Enter source directory containing the above files: SRCDIR
# Enter an empty directory that will hold the source and built files: PROJDIR
# Script will fetch the indilib sources into $PROJDIR/indi
#             create the working directories
# user password needed to obtain root to write the output files
# 

while :
do
  echo "Enter the directory where rolloffino source files are located: "
  read SRCDIR
  if [ ! -d $SRCDIR ]
  then   
    echo "Directory not found"
    break
  fi
  echo "Enter an empty directory in which to build: "
  read PROJDIR
  if [ ! -d $PROJDIR ]
  then
    echo "Directory not found"
    break
  fi
  export PROJDIR
  DEFDIR=`pwd`
  cd $PROJDIR                                                 # set location to build area
  git clone https://github.com/indilib/indi.git               # get indilib sources
  mkdir -p $PROJDIR/indi/3rdparty/indi-rolloffino             # make a source dir under indi
  cp -p $SRCDIR/* $PROJDIR/indi/3rdparty/indi-rolloffino      # copy rolloffino driver sources to source dir
  mkdir -p $PROJDIR/build/3rdparty/indi-rolloffino            # make rolloffino output build directory
  cd $PROJDIR/build/3rdparty/indi-rolloffino                  # set default to build directory
  cmake -DCMAKE_INSTALL_PREFIX=/usr $PROJDIR/indi/3rdparty/indi-rolloffino # cmake, pointing to source files
  sudo make install                                           # compile/link into build dir & copy to /usr/bin
  ls -l /usr/bin/indi_rolloffino
  cd $DEFDIR
  break
done

