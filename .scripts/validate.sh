#/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WD="$( pwd )"
error=0
for x in "$@"; do
 echo "$x"
 if [ -d "$x" ]; then
  cd "$x"
  $DIR/test.sh *
  if [ $? -ne 0 ]; then
   error=1
  fi
  cd $WD
 elif [ -f "$x" ]; then
  $DIR/test.sh "$x" 
  if [ $? -ne 0 ]; then
   error=1
  fi
 fi
done

if [ $error = "1" ]; then exit 1; fi
