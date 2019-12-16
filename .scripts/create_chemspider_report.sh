#/bin/bash
for x in */*.txt; do echo `grep ACCESSION $x| cut -d" " -f2` https://massbank.eu/MassBank/RecordDisplay.jsp?id=`grep ACCESSION $x| cut -d" " -f2` `grep 'CH\$IUPAC' $x| cut -d" " -f2`; done | grep -v N/A
