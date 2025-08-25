#!/bin/bash

# https://www.baeldung.com/linux/ifs-shell-variable
# https://www.computerhope.com/unix/bash/declare.htm
# https://stackoverflow.com/questions/44639307/store-comma-separated-key-value-pair-in-a-string-to-key-value-variable-in-she

# https://askubuntu.com/questions/437182/how-to-check-the-current-value-of-ifs
printf "IFS: %q\n" "$IFS"


kv_string="name=Miel de Jaeger,age=45,city=Lelystad"
OIFS="$IFS"
IFS=","

for pair in kv_string
do
  declare $pair
done

IFS="$OIFS"


echo $name
echo $age
echo $city
