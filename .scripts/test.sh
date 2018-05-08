#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib-0.0.1-default/MassBank-lib-0.0.1/bin/Validator $@
if [ $? -ne 0 ]
then 
 exit 1
fi
