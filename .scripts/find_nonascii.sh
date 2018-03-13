#!/bin/bash
if [ -e $1 ]; then
  LC_ALL=C grep -P -n '[^\x00-\x7f]' $1
  if [ $? -eq 0 ]; then echo Warning: File $1 contains non ASCII characters.; fi
fi

