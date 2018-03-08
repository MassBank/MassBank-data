#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
java -jar $DIR/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib-0.0.1-SNAPSHOT-jar-with-dependencies.jar $@
if [ $? -ne 0 ]
then 
 exit 1
fi
