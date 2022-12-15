haserror=0

find * -name MSBNK-*.txt > all_records.list
grep -Fxv -f legacy.blacklist all_records.list > non_legacy.list
grep -Fxv -f non_legacy.list all_records.list > legacy.list

echo Validate legacy content
.scripts/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib/MassBank-lib/bin/Validator -legacy $(cat legacy.list) || haserror=1

echo Validate nonlegacy content
cat non_legacy.list | split -d --additional-suffix .list -C 500K - records
for i in records*.list; do
  .scripts/MassBank-web/MassBank-Project/MassBank-lib/target/MassBank-lib/MassBank-lib/bin/Validator $(cat $i) || haserror=1
done

rm records*.list
exit $haserror
