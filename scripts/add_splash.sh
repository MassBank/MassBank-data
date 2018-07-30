#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
grep -q 'PK$SPLASH:' $1
if [ $? -eq 0 ]; then
   exit 1
else
  echo No 'PK$SPLASH:' in $1.
  csplit -f $$ -q $1 '/PK$PEAK/'
  sed '1d;$d' -i $$01
  gawk -i inplace '{print $1":"$2}' $$01
  sed ':a;N;$!ba;s/\n/ /g' -i $$01
  splash=$(echo "temp,`cat $$01`" | $DIR/splash 2> /dev/null | head -1 | awk -F',' '{print $1}')
  echo splash calculated: $splash
  sed -i '1iPK$SPLASH: '$splash $1
  rm $$00 $$01
  $DIR/sort_keys.sh $1
fi

