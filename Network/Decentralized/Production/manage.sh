#!/bin/bash

#file you want secure
file=file
passwordfile:pass

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

echo $list_clean_up

for i in "${!A[@]}"; do
	printf 'A[%s] = %s\n' "$i" "${A[i]}" >/dev/null
done

#### Block Header Hashing ####

## Constant info ##

version=0 #4 bytes
version_1=$(printf '%x\n' $version) #hexadecimal
version_2=$(echo "0x00000$version_1") #create a loop to add automatc 0

echo $version_2 > version.txt

## Previous block hash ##

openssl aes-256-cbc -a -salt -in version.txt -out version.enc -pass file:"$passwordfile"
first_prev=$(cat version.enc)

rm version.enc
rm version.txt

## Time ##

date=$(date +%s) #convert epoch converter / Timestamp

## Merkle root ##

full_merkle_root=""

for (( i = 0 ; i < $number ; i++)); do
	echo "Merkle_root$i" > merkle_root$i
	openssl aes-256-cbc -a -salt -in merkle_root$i -out merkle_root$i.enc -pass file:"$passwordfile"
	prompt=$(cat merkle_root$i.enc)
	full_merkle_root="$full_merkle_root $prompt"
done

### Header Hashing END  ###
