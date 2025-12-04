#/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/MassBank-cli-tools/bin/Validator $@
if [ $? -ne 0 ]
then 
 exit 1
fi
