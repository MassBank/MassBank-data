#!/bin/bash 

sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT H2O (0.1% formate)\/acetonitrile (0.1% formate)/AC\$CHROMATOGRAPHY: SOLVENT A H2O (0.1% formate)\nAC\$CHROMATOGRAPHY: SOLVENT B acetonitrile (0.1% formate)/" *.txt

sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT methanol containing 2 mM formate (A)\/water containing 2 mM formate (B)/AC\$CHROMATOGRAPHY: SOLVENT A methanol containing 2 mM formate\nAC\$CHROMATOGRAPHY: SOLVENT B water containing 2 mM formate/" *.txt

sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT A) Water\/Acetic acid (100\/0.1, v\/v) B) Acetonitrile\/Acetic acid (100\/0.1, v\/v)/AC\$CHROMATOGRAPHY: SOLVENT A Water\/Acetic acid (100\/0.1, v\/v)\nAC\$CHROMATOGRAPHY: SOLVENT B Acetonitrile\/Acetic acid (100\/0.1, v\/v)/" *.txt

sed -i "s/AC\$CHROMATOGRAPHY: SOLVENT A) Water\/Acetic acid (100\/0.1, v\/v)  B) Acetonitrile\/Acetic acid (100\/0.1, v\/v)/AC\$CHROMATOGRAPHY: SOLVENT A Water\/Acetic acid (100\/0.1, v\/v)\nAC\$CHROMATOGRAPHY: SOLVENT B Acetonitrile\/Acetic acid (100\/0.1, v\/v)/" *.txt
