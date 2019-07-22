#!/bin/bash
grep -h '^CH$NAME: ' $* | sort | uniq
grep -h '^CH$FORMULA: ' $* | sort | uniq
grep -h '^CH$EXACT_MASS: ' $* | sort | uniq
grep -h '^CH$SMILES: ' $* | sort | uniq
grep -h '^CH$IUPAC: ' $* | sort | uniq
grep -h '^CH$LINK: ' $* | sort | uniq

