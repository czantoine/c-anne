#!/bin/bash

#file you want secure
file=file
passwordfile=pass

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
transaction=$((cpt+=1))

## Previous block hash ##

openssl aes-256-cbc -a -salt -in version.txt -out version.enc -pass file:"$passwordfile"
first_prev=$(cat version.enc)

rm version.enc
rm version.txt
transaction=$((cpt+=1))

## Time ##

full_date=$(date +"%m-%d-%y-%r")
date=$(date +%s) #convert epoch converter / Timestamp
transaction=$((cpt+=1))

## Merkle root ##

transaction_size=0
number_transaction_size=0
transaction_size=$(sed '6!d' db.json) #find the last transaction
number_transaction_size=$(echo $transaction_size | sed 's/[^0-9]*//g')
number_transaction_size=$((number_transaction_size+=1))

full_merkle_root=""

for (( i = 0 ; i < $number ; i++)); do
	echo "Merkle_root$i-$number_transaction_size" > merkle_root$i
	openssl aes-256-cbc -a -salt -in merkle_root$i -out merkle_root$i.enc -pass file:"$passwordfile"
	prompt=$(cat merkle_root$i.enc)
	full_merkle_root="$full_merkle_root $prompt"
	transaction=$((cpt+=1))
done

## Difficulty bits ##

utime="$( TIMEFORMAT='%lR';time ( printf $full_merkle_root | xxd  -c 256 -ps ) 2>&1 1>/dev/null )" #calcule temps de hash en hexa
utime0=$(echo "${utime//s}")
utime1=$(echo "${utime0//m}")
transaction=$((cpt+=1))

## Nonce ##

create_nonce(){
	nonce=$(openssl rand -hex 12)
	transaction=$((cpt+=1))
}

check_nonce()
{
	if grep -Fxq "$nonce" db.json
	then #if found
		nonce=""
		create_nonce
	    	check_nonce
	else
    		echo ""
	fi
}

create_nonce
check_nonce

hashage_nonce=$(openssl aes-256-cbc -a -salt -in merkle_root$i -out merkle_root$i.enc -pass file:"$passwordfile")

### Header Hashing END  ###

### Structure of a Block ###

## Block size ##

block_size=0
number_block_size=0
block_size=$(sed '6!d' db.json) #find the last block
number_block_size=$(echo $block_size | sed 's/[^0-9]*//g')
number_block_size=$((number_block_size+=1))
transaction=$((cptt+=1))

## Block header ##

block_header=$version-$first_prev-$date-$utime1-$nonce
transaction=$((cptt+=1))

## Transaction counter ##

counter_transaction=$((cptt+=1))
counter_header_transaction=$((cpt+=1)

## Transaction ##

final_transaction=$transaction+$counter_header_transaction

### Stucture of a Block END ###

### Hashage ###

hashage=$number_block_size-$block_header-$counter_header_transaction-$final_transaction

### Hashage END ###

