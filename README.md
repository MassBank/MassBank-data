# MassBank-data validation status 
[![Master Validation Status](https://img.shields.io/travis/MassBank/MassBank-data/master.svg?label=Master%20Branch%20Validation)](https://travis-ci.org/MassBank/MassBank-data)
[![Dev Validation Status](https://img.shields.io/travis/MassBank/MassBank-data/dev.svg?label=Dev%20Branch%20Validation)](https://travis-ci.org/MassBank/MassBank-data)
[![DOI](https://zenodo.org/badge/125496536.svg)](https://zenodo.org/badge/latestdoi/125496536)



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
To validate the full date repository use the `validate_all.sh` script. 

## Submit new records to MassBank-data or modify existing records
To submit data or to change existing records:
1. Please fork this repo, clone it to your place and make your changes or add new content in the dev branch.
2. Commit and push your changes to the dev branch of your repo.
3. Create a pull request against the dev branch.

Your pull request will be validated and you will receive a report whether your records meet the [MassBank specs](https://github.com/MassBank/MassBank-web/blob/master/Documentation/MassBankRecordFormat.md).

## Generation of new records for upload to MassBank-data
The preferred software to generate MassBank records is [RMassBank](https://www.bioconductor.org/packages/release/bioc/html/RMassBank.html). RMassBank is in continous development. Hence, use the latest version available, please.

# Release strategy
The release strategy of MassBank-data is similar to the one of MassBank-web and is described below. Additionaly it needs to be taken care of the validation and the codebase for the validation.

## Main branches
We use two main branches, `master` and `dev`. All development should happen in `dev` and we define every commit to `master` to be a release. When new data in the `dev` branch has reached a stable point and is ready to be released, all of the changes should be merged back into `master` somehow and then tagged with a release number. The data of `master` should be validated with the `master` of MassBank-web and the data of `dev` should be validated with `dev` of MassBank-web. If the data contains incompatible changes MassBank-web needs to be released first. Before a merge to `master` is possible a validation needs to be succesfull. The code base for the validation is defined in travis.yml. Depending on the given version the `bump-version.sh` adjusts the content of travis.yml to choose the corresponding branch from MassBank-web. If the version tag contains `SNAPSHOT` like in `2019.09-SNAPSHOT` then its identified as `dev` data branch and travis will pull the `dev` branch of MassBank-web for validation. If `SNAPSHOT` is missing its identified to be a release version and travis will pull the `master` branch of MassBank-web for validation. All versions which get a release tag in github are used by a webhook from zenodo and get a DOI attached. The authors list of the record at zenodo needs to be manually edited to contain `MassBank-consortium and its contributors`.

The release process is discussed in detail below. To use all of the command lines below the [github/hub](https://docs.docker.com/install/linux/docker-ce/ubuntu/) tool is required.


## Release branches
Release branches are created in preparation of a release.

Branch off from: `dev`

Must merge back into: `master`

Branch naming: `release-*`

Release branches support preparation of a new production release. They allow for preparing the version number for a release.

#### Creating a release branch
```
$ git checkout -b release-2019.09 dev
Switched to a new branch "release-2019.09"
$ ./bump-version.sh 2019.09
Set version of release to 2019.09. This version will validate against the master branch of MassBank-web.
git commit -a -m "Bumped version number to 2019.09"
[release-2019.09 74d9424] Bumped version number to 2019.09
$ git push --set-upstream origin release-2019.09
```
#### Finishing a release branch
When the state of the release branch is ready to become a real release, the release branch is merged into `master` with a pull request and tagged for easy future reference.

```
$ hub pull-request -m 'Release version 2019.09'
```
Wait for all checks to finish. Now the release can be merged to `master` and tagged as release. 
```
$ git checkout master
$ git merge --no-ff release-2019.09
$ git push origin master
$ hub release create -m 'Release version 2019.09' 2019.09
```
Now we are done and the release branch may be removed
```
$ git branch -d release-2.1
Deleted branch release-2019.09 (was ff452fe).
```
and the version of the `dev` branch should be incremented.
```
$ git checkout dev
$ ./bump-version.sh 2019.09.1-SNAPSHOT
Set version of release to 2019.09.1-SNAPSHOT. This version will validate against the dev branch of MassBank-web.
git commit -a -m "Bumped version number to 2019.09.1-SNAPSHOT"
[dev 74d9424] Bumped version number to 2019.09.1-SNAPSHOT
$ git push
```
