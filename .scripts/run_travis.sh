haserror=0

for i in  */*.txt; do   echo $i; done | sort | grep Metabolon > filelist.txt
echo filelist.txt
cat filelist.txt
grep Metabolon legacy.blacklist > legacy.blacklist2
echo legacy.blacklist
cat legacy.blacklist2 
diff -u filelist.txt legacy.blacklist2
exit 0


for i in  */*.txt; do 
 echo $i; 
done | sort | split -d --additional-suffix .list -C 500K - records

for i in records*.list; do 
 echo Working on chunk $i
 echo Validate legacy content
 echo Files to process
 diff --old-line-format="" --new-line-format="" $i legacy.blacklist | grep Metabolon
 .scripts/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib/MassBank-lib/bin/Validator -legacy `diff --old-line-format="" --new-line-format="" $i legacy.blacklist` || haserror=1
 echo Validate nonlegacy content
 echo Files to process
 diff --new-line-format="" --unchanged-line-format="" $i legacy.blacklist | grep Metabolon
 .scripts/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib/MassBank-lib/bin/Validator `diff --new-line-format="" --unchanged-line-format="" $i legacy.blacklist` || haserror=1
done
rm records*.list
exit $haserror
