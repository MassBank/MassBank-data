#!/bin/bash 

sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT A:water(0.1%HCOOH)\/ B:acetonitril(0.1%HCOOH)/AC\$CHROMATOGRAPHY: SOLVENT A water with 0.1% formic acid\nAC\$CHROMATOGRAPHY: SOLVENT B acetonitrile with 0.1% formic acid/" *.txt

sed -i -r "s/RETENTION_TIME [0-9]+.[0-9]+/& sec/" PN*.txt
