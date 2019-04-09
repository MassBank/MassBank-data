#!/bin/bash
export LC_ALL=C
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

csplit -f $$ -q $1 '/PK$PEAK/'
sed '1d;$d' -i $$01
cat $$00 > $1
echo 'PK$PEAK: m/z int. rel.int.' >> $1
cat $$01 | sort -k1 -g >> $1
echo "//" >> $1
rm $$00 $$01
