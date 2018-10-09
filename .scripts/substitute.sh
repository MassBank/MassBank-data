#!/bin/bash
FIND=''
FIND+=$1
REPLACE=''
REPLACE+=$2
export FIND
export REPLACE
DIR=$(ls -d */)
if [ ! -z $3 ]; then
 DIR=$3
fi
for x in $DIR
do
 if [ "$x" = ".scripts/" ]; then
  continue
 elif  [ "$x" = "figure/" ]; then
  continue
 fi
 echo $x
 cd  $x
 #ls | parallel -j128 -q ruby -p -i -e "gsub(ENV['FIND'], ENV['REPLACE'])" {}
 ruby -p -i -e "gsub(ENV['FIND'], ENV['REPLACE'])" *
 cd ..
done
