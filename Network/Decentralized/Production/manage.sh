#!/bin/bash

#file you want secure
file=file

if [ ! -f "ip.txt" ]
then
	echo "error file with ip adress"
	exit 1
fi

#number of ip into ip.txt
number=$(wc -l < ip.txt)

#split the orign file by the number of server invalible
cp file repo_dechargement/
cd repo_dechargement
split -n l/$number file database --additional-suffix=.sql
rm file
cd - > /dev/null

search_dir=repo_dechargement

for entry in "$search_dir"/*
do
  list="$list$(echo " $entry")"
done

#delete repo name
list_clean=$(echo "$list" | sed -e 's/\<repo_dechargement\>//g')
list_clean_up=$(echo $list_clean | tr "/" "\n")
A=($list_clean_up)


#give variable for each dir we have created
for i in "${!A[@]}"; do
	printf 'A[%s] = %s\n' "$i" "${A[i]}" >/dev/null
done
