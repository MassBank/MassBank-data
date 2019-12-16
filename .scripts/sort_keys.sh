#!/bin/bash
if [ -e $1 ]; then
  LC_ALL=C grep -P -n '[^\x00-\x7f]' $1
  if [ $? -eq 0 ]; then echo Warning: File $1 contains non ASCII characters.; fi
  grep '^ACCESSION: ' $1 > /tmp/$$sorted.txt
  grep '^RECORD_TITLE: ' $1 >> /tmp/$$sorted.txt
  grep '^DATE: ' $1 >> /tmp/$$sorted.txt
  grep '^AUTHORS: ' $1 >> /tmp/$$sorted.txt
  grep '^LICENSE: ' $1 >> /tmp/$$sorted.txt
  grep '^COPYRIGHT: ' $1 >> /tmp/$$sorted.txt
  grep '^PUBLICATION: ' $1 >> /tmp/$$sorted.txt
  grep '^COMMENT: ' $1 >> /tmp/$$sorted.txt
  grep '^CH$NAME: ' $1 >> /tmp/$$sorted.txt
  grep '^CH$COMPOUND_CLASS: ' $1 >> /tmp/$$sorted.txt
  grep '^CH$FORMULA: ' $1 >> /tmp/$$sorted.txt
  grep '^CH$EXACT_MASS: ' $1 >> /tmp/$$sorted.txt
  grep '^CH$SMILES: ' $1 >> /tmp/$$sorted.txt
  grep '^CH$IUPAC: ' $1 >> /tmp/$$sorted.txt
  grep '^CH$LINK: ' $1 | sort >> /tmp/$$sorted.txt
  grep '^SP$SCIENTIFIC_NAME: ' $1 >> /tmp/$$sorted.txt
  grep '^SP$LINEAGE: ' $1 >> /tmp/$$sorted.txt
  grep '^SP$LINK: ' $1 >> /tmp/$$sorted.txt
  grep '^SP$SAMPLE: ' $1 >> /tmp/$$sorted.txt
  grep '^AC$INSTRUMENT: ' $1 >> /tmp/$$sorted.txt
  grep '^AC$INSTRUMENT_TYPE: ' $1 >> /tmp/$$sorted.txt
  grep '^AC$MASS_SPECTROMETRY: ' $1 >> /tmp/$$sorted.txt
  grep '^AC$CHROMATOGRAPHY: ' $1 >> /tmp/$$sorted.txt
  grep '^MS$FOCUSED_ION: ' $1 >> /tmp/$$sorted.txt
  grep '^MS$DATA_PROCESSING: ' $1 >> /tmp/$$sorted.txt
  grep '^PK$SPLASH: ' $1 >> /tmp/$$sorted.txt

  grep -v -e '^ACCESSION: ' -e '^RECORD_TITLE: ' -e '^DATE: ' -e '^AUTHORS: ' -e '^LICENSE: ' -e '^COPYRIGHT: ' \
   -e '^PUBLICATION: ' -e '^COMMENT: ' -e '^CH$NAME: ' -e '^CH$COMPOUND_CLASS: ' -e '^CH$FORMULA: ' \
   -e '^CH$EXACT_MASS: ' -e '^CH$SMILES: ' -e '^CH$IUPAC: ' -e '^CH$LINK: ' -e '^SP$SCIENTIFIC_NAME: ' \
   -e '^SP$LINEAGE: ' -e '^SP$LINK: ' -e '^SP$SAMPLE: ' -e '^AC$INSTRUMENT: ' -e '^AC$INSTRUMENT_TYPE: ' \
   -e '^AC$MASS_SPECTROMETRY: ' -e '^AC$CHROMATOGRAPHY: ' -e '^MS$FOCUSED_ION: ' -e '^MS$DATA_PROCESSING: ' \
   -e '^PK$SPLASH: ' $1 >> /tmp/$$sorted.txt

  mv /tmp/$$sorted.txt $1

  #sort AC$MASS_SPECTROMETRY
  grep -q 'AC$MASS_SPECTROMETRY:' $1
  if [ $? -eq 0 ]; then
    (csplit -f $$ -q $1 '/AC$MASS_SPECTROMETRY/'; cat $$00; grep 'AC$MASS_SPECTROMETRY: MS_TYPE' $$01; grep 'AC$MASS_SPECTROMETRY: ION_MODE' $$01; grep 'AC$MASS_SPECTROMETRY:' $$01 | grep -v -e 'AC$MASS_SPECTROMETRY: ION_MODE' -e 'AC$MASS_SPECTROMETRY: MS_TYPE'; grep -v 'AC$MASS_SPECTROMETRY:' $$01) > /tmp/$$sorted.txt
    mv /tmp/$$sorted.txt $1
    rm $$00 $$01
  fi

else
  echo Can not find $1.
fi

