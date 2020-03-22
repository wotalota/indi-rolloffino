#!/bin/bash

# build2.sh
# For use after build.sh if changes are made. To use the same directories and bypass the git clone.
# Need to have PROJDIR defined to the same directory

while :
do
  DEFDIR=`pwd`
  cd $PROJDIR                                 
  rm $PROJDIR/build/3rdparty/indi-rolloffino/*
  cd $PROJDIR/build/3rdparty/indi-rolloffino                  # set default to build directory
  cmake -DCMAKE_INSTALL_PREFIX=/usr $PROJDIR/indi/3rdparty/indi-rolloffino # cmake, pointing to source files
  sudo make install                                           # compile/link into build dir & copy to /usr/bin
  ls -l /usr/bin/indi_rolloffino
  cd $DEFDIR
  break
done

