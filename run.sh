#!/bin/bash
for x in *; do
	if [ -d "$x" ]; then
		.scripts/validate.sh $x 2<&1  | grep -A2 'CH\$SMILES:' | grep Error | awk '{print $3}' > list
		for y in `cat list`; do
			ls $x/$y
			.scripts/subst_smi.sh $x/$y
		done
		rm list
	fi
done


