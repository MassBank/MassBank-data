#!/bin/bash
for x in *; do
	if [ -d "$x" ]; then
		.scripts/validate.sh $x 
	fi
done


