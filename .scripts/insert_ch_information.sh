#!/bin/bash

array=( $@ )
len=${#array[@]}
insert=${array[0]}
filelist=${array[@]:1:$len}

echo $insert
for x in $filelist; do
	grep '^ACCESSION: ' $x > /tmp/$$.txt
	grep '^RECORD_TITLE: ' $x >> /tmp/$$.txt
	grep '^DATE: ' $x >> /tmp/$$.txt
	grep '^AUTHORS: ' $x >> /tmp/$$.txt
	grep '^LICENSE: ' $x >> /tmp/$$.txt
	grep '^COPYRIGHT: ' $x >> /tmp/$$.txt
	grep '^PUBLICATION: ' $x >> /tmp/$$.txt
	grep '^COMMENT: ' $x >> /tmp/$$.txt
	grep '^CH$NAME: ' $insert >> /tmp/$$.txt
	grep '^CH$COMPOUND_CLASS: '  $x >> /tmp/$$.txt
	grep '^CH$FORMULA: ' $insert >> /tmp/$$.txt
	grep '^CH$EXACT_MASS: ' $insert >> /tmp/$$.txt
	grep '^CH$SMILES: '  $insert >> /tmp/$$.txt
	grep '^CH$IUPAC: ' $insert >> /tmp/$$.txt
	grep '^CH$LINK: ' $insert >> /tmp/$$.txt
	grep '^SP$SCIENTIFIC_NAME: ' $x >> /tmp/$$.txt
	grep '^SP$LINEAGE: ' $x >> /tmp/$$.txt
	grep '^SP$LINK: ' $x >> /tmp/$$.txt
	grep '^SP$SAMPLE: ' $x >> /tmp/$$.txt
	grep '^AC$INSTRUMENT: ' $x >> /tmp/$$.txt
	grep '^AC$INSTRUMENT_TYPE: ' $x >> /tmp/$$.txt
	grep '^AC$MASS_SPECTROMETRY: ' $x >> /tmp/$$.txt
	grep '^AC$CHROMATOGRAPHY: ' $x >> /tmp/$$.txt
	grep '^MS$FOCUSED_ION: ' $x >> /tmp/$$.txt
	grep '^MS$DATA_PROCESSING: ' $x >> /tmp/$$.txt
	grep '^PK$SPLASH: ' $x >> /tmp/$$.txt

	grep -v -e '^ACCESSION: ' -e '^RECORD_TITLE: ' -e '^DATE: ' -e '^AUTHORS: ' -e '^LICENSE: ' -e '^COPYRIGHT: ' \
	   -e '^PUBLICATION: ' -e '^COMMENT: ' -e '^CH$NAME: ' -e '^CH$COMPOUND_CLASS: ' -e '^CH$FORMULA: ' \
	   -e '^CH$EXACT_MASS: ' -e '^CH$SMILES: ' -e '^CH$IUPAC: ' -e '^CH$LINK: ' -e '^SP$SCIENTIFIC_NAME: ' \
	   -e '^SP$LINEAGE: ' -e '^SP$LINK: ' -e '^SP$SAMPLE: ' -e '^AC$INSTRUMENT: ' -e '^AC$INSTRUMENT_TYPE: ' \
	   -e '^AC$MASS_SPECTROMETRY: ' -e '^AC$CHROMATOGRAPHY: ' -e '^MS$FOCUSED_ION: ' -e '^MS$DATA_PROCESSING: ' \
	   -e '^PK$SPLASH: ' $x >> /tmp/$$.txt
	mv /tmp/$$.txt $x
done

