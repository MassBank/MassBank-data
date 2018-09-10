#/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
error=0
for x in $@; do
 if [ -d "$x" ]; then
  cd $x
  bash $DIR/test.sh *
  if [ $? -ne 0 ]; then
   error=1
  fi
  cd ..
 elif [ -f $x ]; then
  bash $DIR/test.sh $x 
  if [ $? -ne 0 ]; then
   error=1
  fi
 fi
done

if [ $error = "1" ]; then exit 1; fi
