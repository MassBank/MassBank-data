#!/bin/bash

echo "Fix redundant flow gradient information"
sed -i 's/0\/100 at 17.1-25 min/0\/100 at 25 min/' *.txt

echo "Unify the column name, e.g. stripping extra spaces"
sed -i 's/ACQUITY  UPLC BEH Amide 1.7 um 2.1x100mm, Waters/ACQUITY UPLC BEH Amide 1.7 um 2.1x100mm, Waters/' *.txt
sed -i 's/ACQUITY UPLC BEH Amide 1.7 um 2.1x100 mm, Waters/ACQUITY UPLC BEH Amide 1.7 um 2.1x100mm, Waters/' *.txt
sed -i 's/ACQUITY UPLC BEH Amide 1.7 um 2.1x100mm, Water$/ACQUITY UPLC BEH Amide 1.7 um 2.1x100mm, Waters/' *.txt

echo "Fix solvent information"
sed -i 's/Acetonitrile:WATER/Acetonitrile:Water/' *.txt
sed -i 's/Acetonitrile:Water with 0.01/Acetonitrile:Water 95:5 with 0.01/' *.txt
