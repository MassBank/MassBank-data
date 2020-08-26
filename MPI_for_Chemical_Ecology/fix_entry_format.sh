#!/bin/bash

# In "doi:10.1021/ac300304u" we find a reference for the Orbitrap data with originally was used in "doi:10.1021/ac101825k"
# In the PredRet paper a dataset called "MPI_Symmetry" was used which also references to "doi:10.1021/ac101825k"
# In "doi:10.1021/ac101825k" solvent A is told to be Water 
# Also: The FLOW_GRADIENT states the percentage of Acetonitrile, which I think typically refers to solvent B
sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT CH3CN(0.1%HCOOH)\/ H2O(0.1%HCOOH)/AC\$CHROMATOGRAPHY: SOLVENT A H2O(0.1%HCOOH)\nAC\$CHROMATOGRAPHY: SOLVENT B CH3CN(0.1%HCOOH)/" *.txt
