#!/bin/bash

function getMaxNumberOfLines() {
  CSV_FILE_1=$1
  CSV_FILE_2=$2
  ENVIRONMENT=$3

  NUMBER_OF_LINES_1=$(awk -F ',' -v ENVIRONMENT=$ENVIRONMENT '$10 ~ ENVIRONMENT { count[$5]++ }; END { print length(count) }' $CSV_FILE_1)
  NUMBER_OF_LINES_2=$(awk -F ',' -v ENVIRONMENT=$ENVIRONMENT '$10 ~ ENVIRONMENT { count[$5]++ }; END { print length(count) }' $CSV_FILE_2)
  echo $(( $NUMBER_OF_LINES_1 > $NUMBER_OF_LINES_2 ? $NUMBER_OF_LINES_1 : $NUMBER_OF_LINES_2 ))
}

function print() {
  CSV_FILE=$1
  ENVIRONMENT=$2
  MAX_NUMBER_OF_LINES=$3

  CMDB_ENTRIES="$(awk -F ',' -f cmdb.awk -v ENVIRONMENT=$ENVIRONMENT $CSV_FILE | sort)"
  CMDB_ENTRIES=$(echo "$CMDB_ENTRIES" | awk -F ',' -f summary.awk -v MAX_NUMBER_OF_LINES=$MAX_NUMBER_OF_LINES)
  printf "%s" "$CMDB_ENTRIES"
}


# Main
max_dev=$(getMaxNumberOfLines "u_cmdb_unix_5_14.csv" "u_cmdb_unix_5_15.csv" "Development")
max_tst=$(getMaxNumberOfLines "u_cmdb_unix_5_14.csv" "u_cmdb_unix_5_15.csv" "Test")
max_acc=$(getMaxNumberOfLines "u_cmdb_unix_5_14.csv" "u_cmdb_unix_5_15.csv" "Acceptance")
max_prd=$(getMaxNumberOfLines "u_cmdb_unix_5_14.csv" "u_cmdb_unix_5_15.csv" "Production")

>5_14.txt
print "u_cmdb_unix_5_14.csv" "Development" $max_dev >>5_14.txt
print "u_cmdb_unix_5_14.csv" "Test" $max_tst >>5_14.txt
print "u_cmdb_unix_5_14.csv" "Acceptance" $max_acc >>5_14.txt
print "u_cmdb_unix_5_14.csv" "Production" $max_prd >>5_14.txt

>5_15.txt
print "u_cmdb_unix_5_15.csv" "Development" $max_dev >>5_15.txt
print "u_cmdb_unix_5_15.csv" "Test" $max_tst >>5_15.txt
print "u_cmdb_unix_5_15.csv" "Acceptance" $max_acc >>5_15.txt
print "u_cmdb_unix_5_15.csv" "Production" $max_prd >>5_15.txt


# Merge files
paste 5_14.txt 5_15.txt | sed "s/@@blank@@//g" | column -s $'\t' -t -L

