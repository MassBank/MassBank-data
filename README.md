# MassBank-data validation status 
[![Validation Status](https://travis-ci.org/MassBank/MassBank-data.svg?branch=master)](https://travis-ci.org/MassBank/MassBank-data)

This repo contains all MassBank records and uses the Travis CI to validate the content of all records with the new [Validator](https://github.com/MassBank/MassBank-web/blob/master/MassBank-Project/MassBank-lib/src/main/java/massbank/admin/Validator2.java) from MassBank-web.

## Validate new record files locally (linux only)
To validate new record files locally please clone this repo. Under the `.scripts` directory create the source tree of the [MassBank-web](https://github.com/MassBank/MassBank-web) project and compile it, because the validator program is needed.
You can use the following commands:
```
git clone --depth 1 -q https://github.com/MassBank/MassBank-web.git .scripts/MassBank-web
mvn -q -f .scripts/MassBank-web/MassBank-Project/MassBank-lib/pom.xml install
```
Now its possible to validate record files locally. `validate.sh` supports validation of a single record file, several files as well as one or several directories containing record files, eg. 
```
./.scripts/validate.sh <your_directory_containing_record_files>
```.

## Submit new records to MassBank-data or modify existing records
To submit data or to change existing records:
1. Please fork this repo and make your changes.
2. To enable validation of records in a new subdirectory please run `./.scripts/pre-commit` or create a symlink/copy `./.scripts/pre-commit` to `.git/hooks/pre-commit` prior commiting the changes.
3. Commit and push your changes to your repo.
4. Create a pull request.

Your pull request will be validated and you will receive a report whether your records meet the [MassBank specs](https://github.com/MassBank/MassBank-web/blob/master/Documentation/MassBankRecordFormat.md).
