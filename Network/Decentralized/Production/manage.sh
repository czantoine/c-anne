#!/bin/bash

if [ ! -f "ip.txt" ]
then
        echo "error file with ip adress"
        exit 1
fi

#number of ip into ip.txt
number=$(wc -l < ip.txt)

#split the orign file by the number of server invalible
split -n l/$number file database --additional-suffix=.sql
