#!/bin/bash 

sed -i "s/maXis, Bruker Daltonics/maXis (Bruker Daltonics)/" *.txt
sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT 0.1% formic acid in water (A) and Acetonitrile (B)/AC\$CHROMATOGRAPHY: SOLVENT A water with 0.1% formic acid\nAC\$CHROMATOGRAPHY: SOLVENT B acetonitrile with 0.1% formic acid/" *.txt
sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT 0.1% formic acid in water (A) and methanol (B)/AC\$CHROMATOGRAPHY: SOLVENT A water with 0.1% formic acid\nAC\$CHROMATOGRAPHY: SOLVENT B methanol with 0.1% formic acid/" *.txt



