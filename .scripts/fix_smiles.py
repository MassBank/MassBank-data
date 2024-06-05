#!/usr/bin/python
import sys
import pubchempy as pcp


def query_yes_no(question, default="yes"):
    """Ask a yes/no question via raw_input() and return their answer.
    
    "question" is a string that is presented to the user.
    "default" is the presumed answer if the user just hits <Enter>.
        It must be "yes" (the default), "no" or None (meaning
        an answer is required of the user).

    The "answer" return value is one of "yes" or "no".
    """
    valid = {"yes": "yes", "y": "yes", "ye": "yes",
             "no": "no", "n": "no"}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while 1:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        if default is not None and choice == '':
            return default
        elif choice in valid.keys():
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' (or 'y' or 'n').\n")


def inplace_change(filename, old_string, new_string):
    # Safely read the input filename using 'with'
    with open(filename) as f:
        s = f.read()
        if old_string not in s:
            print('"{old_string}" not found in {filename}.'.format(**locals()))
            return

    # Safely write the changed content, if found in the file
    with open(filename, 'w') as f:
        print('Changing "{old_string}" to "{new_string}" in {filename}'.format(**locals()))
        s = s.replace(old_string, new_string)
        f.write(s)


names = []
formula = ""
inchi = ""

for line in open(sys.argv[1]):
    if "CH$NAME" in line:
        names.append(''.join(line.split(" ")[1:]).strip().lower())
    if "CH$FORMULA" in line:
        formula = ''.join(line.split(" ")[1:]).strip()
    if "CH$IUPAC" in line:
        inchi = ''.join(line.split(" ")[1:]).strip()
    if "CH$SMILES" in line:
        smiles = ''.join(line.split(" ")[1:]).strip()

results = pcp.get_compounds(inchi, namespace=u'inchi')

if smiles == results[0].isomeric_smiles:
    print('Nothing to do! Exiting.')
    sys.exit(0)

#clear screen
print(chr(27) + "[2J")
if len(results) != 1:
    print("#results != 1; exiting")
    sys.exit(1)

if results[0].molecular_formula == formula:
    print('Formula matches ' + '\033[92m[OK]\033[0m')
    print(formula)
else:
    print(f'Formula from pubchem: {results[0].molecular_formula}')
    print(f'Formula from file: {formula}')
    print('Formulas different ' + '\033[93m[!!]\033[0m')

print(f'InChI : {inchi}')

synonyms = []
if results[0].synonyms is not None:
    synonyms = [x.encode('utf-8').lower() for x in results[0].synonyms]

common_names = []

print()
for name in names:
    if name in synonyms:
        print('Name in synonyms ' + '\033[92m[OK]\033[0m')
        common_names.append(name)

print(f'Names from pubchem: {synonyms}')
print(f'Names from file: {names}')
if len(common_names):
    print('\033[92m')
    print(common_names)
    print('\033[0m')
print()
print()
if (results[0].molecular_formula == formula) and (len(common_names)):
    inplace_change(sys.argv[1], 'CH$SMILES: ' + smiles, 'CH$SMILES: ' + results[0].isomeric_smiles)
else:
    sub = query_yes_no(
        'Substitute \033[91m' + smiles + '\033[0m by \033[92m ' + results[0].isomeric_smiles + '\033[0m?', default="no")
    if sub == "yes":
        inplace_change(sys.argv[1], 'CH$SMILES: ' + smiles, 'CH$SMILES: ' + results[0].isomeric_smiles)

print()
print()