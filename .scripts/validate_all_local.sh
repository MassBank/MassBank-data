#!/bin/bash
for x in *; do
	if [ "$x" = "figure" ]; then
		continue
	fi
	if [ -d "$x" ]; then
		bash .scripts/validate.sh $x 
	fi
done


