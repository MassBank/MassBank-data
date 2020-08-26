#!/bin/bash 

sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT (A)5 mM ammonium acetate, (B)CH3CN/AC\$CHROMATOGRAPHY: SOLVENT A 5 mM ammonium acetate\nAC\$CHROMATOGRAPHY: SOLVENT B CH3CN/" *.txt

sed -i -r "s/RETENTION_TIME [0-9]+.[0-9]+/& sec/" TY0000[4-9][0-9].txt
sed -i -r "s/RETENTION_TIME [0-9]+.[0-9]+/& sec/" TY00003[89].txt
sed -i -r "s/RETENTION_TIME [0-9]+.[0-9]+/& sec/" TY000100.txt
