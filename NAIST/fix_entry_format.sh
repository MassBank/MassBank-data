#!/bin/bash 

sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT 0.1%formate-water \/ 0.1%formate-acetonitrile/AC\$CHROMATOGRAPHY: SOLVENT A 0.1%formate-water\nAC\$CHROMATOGRAPHY: SOLVENT B 0.1%formate-acetonitrile/" *.txt

