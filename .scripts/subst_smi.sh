#!/bin/bash
if [ -e $1 ]; then
  LC_ALL=C grep -P -n '[^\x00-\x7f]' $1
  if [ $? -eq 0 ]; then echo Warning: File $1 contains non ASCII characters.; fi

  grep -q 'CH$SMILES: ' $1
  if [ $? -eq 0 ]; then
    csplit -f $$ -q $1 '/CH$SMILES: /'
    csplit -f $$a -q ~/GIT/MassBank-data.old/$1 '/CH$SMILES: /'
    (cat $$00; head -n1 $$a01; tail -n+2 $$01) > $1
    rm $$00 $$01 $$a00 $$a01
  fi
else
  echo Can not find $1.
fi

