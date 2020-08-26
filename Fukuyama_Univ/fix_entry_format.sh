#!/bin/bash 

# Information extracted from original publication: 	https://doi.org/10.5458/jag.57.199
sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT CH3CN\/H2O/AC\$CHROMATOGRAPHY: SOLVENT A CH3CN\nAC\$CHROMATOGRAPHY: SOLVENT B H2O/" *.txt
