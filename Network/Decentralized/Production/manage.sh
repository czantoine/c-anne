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

#Encrypt split files parts
	#Create a dir with private and public key
for (i = 0; i < $number; i++); do
	openssl genrsa -out private_${i}.pem
	open rsa -in private_${i}.pem -out public_${i}.pem -outform PEM -pubout
	openssl rsault -encrypt -inkey public_${i}.pem -pubin -in file_${i}.sql -out file_{i}.ssl
done

#delete original split file part
for (i = 0; i < $number; i++); do
	rm file_${i}.sql
done

#send files into servers

for (i = 0; i < $number; i++); do
	scp file_{i}.ssl servername@ip.txt:.
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

### Others informations ###

mineur=$(hostame)

status=confirmed

size=$(echo $hashage | wc -c)
size2=$(echo $full_merkle_root | wc -c)

poid=$((size+size2))

### Others informations END ###

### Menu html ###

menu0(){
	echo "" >> $hasgage_block.html
	echo '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">' >> $hasgage_block.html
}

menu1(){
	echo -e '\t<div class="topnav" id="myTopnav">' >> $hasgage_block.html
	echo -e '\t\t<a href="index.html" class="active">Home</a>' >> $hasgage_block.html
	echo -e '\t\t<a href="all_transactions.html">Transactions</a>' >> $hasgage_block.html
	echo -e '\t\t<a href="all_blocks.html">Blocs</a>' >> $hasgage_block.html
	echo -e '\t\t<a href="about.html">About</a>' >> $hasgage_block.html
	echo -e '\t\t<a href="javascript:void(0);" class="icon" onclick="myFunction()">' >> $hasgage_block.html
	echo -e '\t\t\t<i class="fa fa-bars"></i>' >> $hasgage_block.html
	echo -e '\t\t</a>' >> $hasgage_block.html
	echo -e '\t</div>' >> $hasgage_block.html
}

menu2(){
	echo -e '\t<script src="script/menu.js"></script>' >> $hasgage_block.html
}

menu3(){
	echo "" >> $hasgage.html
	echo '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">' >> $hasgage.html
}

menu4(){
	echo -e '\t<div class="topnav" id="myTopnav">' >> $hasgage.html
	echo -e '\t\t<a href="index.html" class="active">Home</a>' >> $hasgage.html
	echo -e '\t\t<a href="all_transactions.html">Transactions</a>' >> $hasgage.html
	echo -e '\t\t<a href="all_blocks.html">Blocs</a>' >> $hasgage.html
	echo -e '\t\t<a href="about.html">About</a>' >> $hasgage.html
	echo -e '\t\t<a href="javascript:void(0);" class="icon" onclick="myFunction()">' >> $hasgage.html
	echo -e '\t\t\t<i class="fa fa-bars"></i>' >> $hasgage.html
	echo -e '\t\t</a>' >> $hasgage.html
	echo -e '\t</div>' >> $hasgage.html
}

menu5(){
	echo -e '\t<script src="script/menu.js"></script>' >> $hasgage.html	
}

### Menu html END ###

### Added db.json and html blocks file ###

## Blocks ##

new_transactions=file_transactions.txt
touch $new_transactions

echo -e '\t\t{' >> $new_transactions
echo -e '\t\t"hashage": "'$hashage'"'',' >> $new_transactions
echo -e '\t\t"hashage_w": "<a href="'$hashage'".html">'$hashage'</a>",' >> $new_transactions
echo -e '\t\t"block": "'$number_block_size'"'',' >> $new_transactions
echo -e '\t\t"horodage": "'$full_date'"'',' >> $new_transactions
echo -e '\t\t"hauteur": "'$number'"'',' >> $new_transactions
echo -e '\t\t"mineur": "'$mineur'"'',' >> $new_transactions
echo -e '\t\t"nombre_transactions": "'$final_transaction'"'',' >> $new_transactions
echo -e '\t\t"difficulte": "'$utime1'"'',' >> $new_transactions
echo -e '\t\t"merkle": "'$full_merkle_root'"'',' >> $new_transactions
echo -e '\t\t"statut": "'$status'"'',' >> $new_transactions
echo -e '\t\t"taille": "'$size'"'',' >> $new_transactions
echo -e '\t\t"poid": "'$poid'"'',' >> $new_transactions
echo -e '\t\t"nonce": "'$nonce'"'',' >> $new_transactions
echo -e '\t\t"version": "'$version'"' >> $new_transactions
echo -e '\t\t},' >> $new_transactions

add_new_transactions=$(cat $new_transactions)

new_db=$(awk 'NR==3{system("cat '$new_transactions' ")} 1' db.json)
echo "$new_db" > db.json

rm $new_transactions

## Transactions ##

for (( i = 0 ; i < $number ; i++)); do

	hashage_block=$i-$block_header-$final_transaction

	decimal_number_block_size=$(echo "0.$i+$number_block_size" | bc)

	new_block$i=file_transactions.txt$i
	touch new_block$i

	echo -e '\t\t{' >> $new_block$i
	echo -e '\t\t"hashage": "'$hashage_block'"'',' >> $new_block$i
	 >> $new_block$i
	echo -e '\t\t"block": "'$decimal_number_block_size'"'',' >> $new_block$i
	echo -e '\t\t"horodage": "'$full_date'"'',' >> $new_block$i
	echo -e '\t\t"difficulte": "'$utime1'"'',' >> $new_block$i
	echo -e '\t\t"hauteur": "'$number'"'',' >> $new_block$i
	echo -e '\t\t"statut": "'$status'"'',' >> $new_block$i
	echo -e '\t\t"taille": "'$size'"'',' >> $new_block$i
	echo -e '\t\t"poid": "'$poid'"'',' >> $new_block$i
	echo -e '\t\t"version": "'$version'"' >> $new_block$i
	echo -e '\t\t}' >> $new_block$i

	add_new_block=$(cat new_block$i)
	find_line=$(sed -n '/transactions/=' db.json)
	find_line=$(($find_line+1))
	new_db=$(awk 'NR=='find_line'{system("cat '$new_block$i' ")} 1' db.json)
	echo "$new_db" > db.json

	rm $new_block$i

	### Create html file ###

	## Transactions file ##

	touch $hashage_block.html
	echo "$hashage_block.html" >> stock_path.txt

	echo -e '<!DOCTYPE html>' >> $hashage_block.html
	echo -e '<html lang="fr">' >> $hashage_block.html
	echo "" >> $hasgage_block.html
	echo '<link rel="stylesheet" href="css/style.css">' >> $hashage_block.html
	echo '<meta name="author" content="czantoine">' >> $hashage_block.html
	echo '<meta charset="UTF-8">' >> $hashage_block.html
	echo '<meta name="viewport" content="width=device-width, initial-scale=1.0">' >> $hashage_block.html
	echo '<link rel="shortcut icon" type="image/png" href="c-anne_logo.png"/>' >> $hasgage_block.html
	echo "" >> $hasgage_block.html
	echo '<title>C-anne Journal</title>' >> $hasgage_block.html

	menu0

	echo "" >> $hashage_block.html
	echo '<body>' >> $hashage_block.html

	menu1
	
	echo "" >> $hashage_block.html

	echo -e '<div class="margin">' >> $hasgage_block.html

	echo -e '\t<h2>Résumé</h2>' >> $hashage_block.html
	echo "" >> $hashage_block.html
	echo -e "\t<p>Hashage $hashage</p>" >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo -e "\t<h2>Détails</h2>" >> $hashage_block.html

	echo -e '\t<p>Hashage<span STYLE="padding:0 0 0 80px;">'$hashage'</p>' >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo -e '\t<p><b>Statut</b> <span STYLE="padding:0 0 0 100px;">'Confirmé'</p>' >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo -e '\t<p><b>Heure reçue</b> <span STYLE="padding:0 0 0 55px;">'$full_date'</p>' >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo -e '\t<p><b>Taille</b> <span STYLE="padding:0 0 0 108px;">'$size'</p>' >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo -e '\t<p><b>Poids</b> <span STYLE="padding:0 0 0 103px;">'$poid'</p>' >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo -e '\t<p><b>Confirmations</b> <span STYLE="padding:0 0 0 40px;">'$confirmations'</p>' >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo -e '\t<p><b>Nonce</b> <span STYLE="padding:0 0 0 40px;">'$nonce'</p>' >> $hashage_block.html
	echo -e "\t<hr>" >> $hashage_block.html

	echo "" >> $hashage_block.html

	menu2

	echo "</body>" >> $hashage_block.html
	echo "</html>" >> $hashage_block.html

	echo -e '</div>' >> $hasgage_block.html

	### Create Transactions html file END ###
	
done

### Added db.json and html blocks file END ###

### Create Block file html ###

touch $hashage.html

echo -e '<!DOCTYPE html>' >> $hashage.html
echo -e '<html lang="fr" >' >> $hashage.html
echo "" >> $hasgage_block.html
echo '<link rel="stylesheet" href="css/style.css">' >> $hashage.html
echo '<meta name="author" content="czantoine">' >> $hashage.html
echo '<meta charset="UTF-8">' >> $hashage.html
echo '<meta name="viewport" content="width=device-width, initial-scale=1.0">' >> $hashage.html
echo '<link rel="shortcut icon" type="image/png" href="c-anne_logo.png"/>' >> $hashage.html
echo "" >> $hasgage_block.html
echo '<title>C-anne Journal</title>' >> $hashage.html

menu3

echo "" >> $hashage.html
echo "<body>" >> $hashage.html

menu4

echo "" >> $hashage.html

echo -e '<div class="margin">' >> $hasgage_block.html

echo -e "\t<h2>Bloc $number_block_size</h2>" >> $hashage.html
echo "" >> $hashage.html

echo -e '\t<p>Hashage<span STYLE="padding:0 0 0 140px;">'$hashage'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Confirmations</b> <span STYLE="padding:0 0 0 100px;">'$confirmations'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Horodatage (timestramp)</b> <span STYLE="padding:0 0 0 10px;">'$full_date'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Hauteur</b> <span STYLE="padding:0 0 0 150px;">'$number'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Mineur</b> <span STYLE="padding:0 0 0 160px;">'$mineur'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Nombre de transactions</b> <span STYLE="padding:0 0 0 25px;">'$number'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Difficulté</b> <span STYLE="padding:0 0 0 140px;">'$number'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Racine de Merkle</b> <span STYLE="padding:0 0 0 78px;">'$full_merkle_root'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Version</b> <span STYLE="padding:0 0 0 150px;">'$version'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Poids</b> <span STYLE="padding:0 0 0 170px;">'$poid'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Taille</b> <span STYLE="padding:0 0 0 165px;">'$size'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html

echo -e '\t<p><b>Nonce</b> <span STYLE="padding:0 0 0 165px;">'$nonce'</p>' >> $hashage.html
echo -e "\t<hr>" >> $hashage.html
echo -e "\t<br/>" >> $hashage.html
echo "" >> $hasgage.html

echo -e "\t<h2>Transactions des blocs</h2>" >> $hashage.html
echo "" >> $hasgage.html

n=1
for (( i = 0 ; i < $number ; i++)); do
	rep_stock_path=$(sed -n "$n"p stock_path.txt)
	echo -e '\t<a href="'$rep_stock_path.html'">'$rep_stock_path'</a>' >> hashage.html
	echo -e "\t<hr>" >> hashage.html
	n=$((n+1))
do

echo "" >> $hashage.html

menu5

echo "</body>" >> $hashage.html
echo "</html>" >> $hashage.html

echo -e '</div>' >> $hasgage.html

rm stock_path.txt

### Create Block file html END ##

### Communication between servers ###

for server in $(cat ip.txt) ; do
	ssh root@${server} 'bash -s' < ./permission_check.sh ;
done

### Communication between servers END ###
