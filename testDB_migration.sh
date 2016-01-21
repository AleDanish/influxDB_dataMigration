#!/bin/bash

host_start=$1
host_end=$2
record_number=10
file1=prova.json
file2=prova.txt
file3=prova2.txt

echo "Populate database " $host_start "with" $record_number " records"
bash db_actions/popolateDB.sh $host_start $record_number

echo "Get data from the database on host" $host_start
bash db_actions/selectDB.sh $host_start $file1

echo "Convert " $file1 " to " $file2
python convert/convertInfluxDB_JsonToTxt.py $file1 

echo "Insert data to database on host" $host_end
bash db_actions/popolateDBFromFile.sh $host_end $file2

#echo "Get data from database on host " $host_end
#bash db_actions/selectDB.sh $host_end $file3
