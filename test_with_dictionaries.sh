#!/bin/bash

declare -a tra_files
declare -A tra_file

tra_file["file_name"]="bwengine.tra"
tra_file["tibco_env_HEAP_SIZE"]=2048
tra_file["java_heap_size_max"]=
tra_file["java_heap_size_initial"]=128

tra_files+=(tra_file)



for tra_file_dict in "${tra_files[@]}"; do
    declare -n dict="$tra_file_dict"
    echo ${dict["file_name"]}
    echo ${dict["tibco_env_HEAP_SIZE"]}
    echo ${dict["java_heap_size_max"]}
    echo ${dict["java_heap_size_initial"]}
done





#echo ${tra_file["file_name"]}
#
#echo ${tra_file[0]}



#declare -a persons
#
#for i in {0..9}
#do
#  echo $i
#  declare -A person
#  person["name"]=miel
#  persons[$i]=$person
#
#done
#
#
#
#for p in $persons
#do
#
#  echo $p
#  echo "test"
#done





