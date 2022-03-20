#!/bin/sh
libver="0.31"

if grep -Fxqs $libver ./core/1fxlib/ver
then
   echo "Proper 1fxlib detected: $libver. Continuing.."
else
   echo "This version of 1fx. Mod requires 1fxlib $libver to run!"
   exit
fi

# Boe!Man 6/25/13: Set global variables.
unset LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./1fx/core/1fxlib

# Run SoF2MP server w/ 1fx. Mod.
cd ..
./sof2ded +set net_ip 0.0.0.0 +set net_port 20100 +set fs_game 1fx +set vm_game 0 +exec Config.cfg
