#!/bin/bash
n=10 #number of record to get
if [ "$3" != "" ];
then
n=$3
fi

curl='/usr/bin/curl'
args="-o $2 -G"
address="http://$1:8086/query"
options="--data-urlencode db=mydb --data-urlencode"
query="q=SELECT * FROM table1"
$curl $args $address $options "$query"
echo $curl $args $address $options $query
