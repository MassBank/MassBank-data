# MassBank-data validation status 
![Travis (.org) branch](https://img.shields.io/travis/MassBank/MassBank-data/master.svg?label=Master%20Branch%20Validation) ![Travis (.org) branch](https://img.shields.io/travis/MassBank/MassBank-data/dev.svg?label=DevMaster%20Branch%20Validation)

This repo contains all MassBank records and uses the Travis CI to validate the content of all records with the new [Validator](https://github.com/MassBank/MassBank-web/blob/master/MassBank-Project/MassBank-lib/src/main/java/massbank/Validator.java) from MassBank-web.

## Validate new record files locally (linux only)
To validate new record files locally please clone this repo. Under the `.scripts` directory create the source tree of the [MassBank-web](https://github.com/MassBank/MassBank-web) project and compile it, because the validator program is needed.
You can use the following commands:
```
git clone --depth 1 -q https://github.com/MassBank/MassBank-web.git .scripts/MassBank-web
mvn -q -f .scripts/MassBank-web/MassBank-Project/MassBank-lib/pom.xml install
```
Now its possible to validate record files locally. `validate.sh` supports validation of a single record file, several files as well as one or several directories containing record files, eg. 
```
./.scripts/validate.sh AAFC
```
To validate the full date repository use the `validate_all_local.sh` script. 

## Submit new records to MassBank-data or modify existing records
To submit data or to change existing records:
1. Please fork this repo, clone it to your place and make your changes or add new content in the dev branch.
2. To enable automatic validation of records in a new subdirectory please run `./.scripts/pre-commit` or create a symlink/copy `./.scripts/pre-commit` to `.git/hooks/pre-commit` prior commiting the changes.
3. Commit and push your changes to the dev branch of your repo.
4. Create a pull request against the dev branch.

Your pull request will be validated and you will receive a report whether your records meet the [MassBank specs](https://github.com/MassBank/MassBank-web/blob/master/Documentation/MassBankRecordFormat.md).

## Generation of new records for upload to MassBank-data
The preferred software to generate MassBank records is [RMassBank](https://www.bioconductor.org/packages/release/bioc/html/RMassBank.html). RMassBank is in continous development. Hence, use the latest version available, please.
