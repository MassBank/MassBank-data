#!/bin/bash
echo $1 > VERSION

if $(echo $1 | grep -q SNAPSHOT); then 
  echo Set version of development release to $1. This version will validate against the dev branch of MassBank-web.
cat << 'EOF' > .travis.yml
language: java
cache:
  directories:
  - $HOME/.m2
install:
  - git clone --branch dev --depth 1 -q https://github.com/MassBank/MassBank-web.git .scripts/MassBank-web
  - mvn -q -f .scripts/MassBank-web/MassBank-Project/MassBank-lib/pom.xml package
script: 
  - .scripts/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib/MassBank-lib/bin/Validator ./*
EOF
else
  echo Set version of release to $1. This version will validate against the master branch of MassBank-web.
cat << 'EOF' > .travis.yml
language: java
cache:
  directories:
  - $HOME/.m2
install:
  - git clone --depth 1 -q https://github.com/MassBank/MassBank-web.git .scripts/MassBank-web
  - mvn -q -f .scripts/MassBank-web/MassBank-Project/MassBank-lib/pom.xml package
script: 
  - .scripts/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib/MassBank-lib/bin/Validator ./*
EOF
fi
