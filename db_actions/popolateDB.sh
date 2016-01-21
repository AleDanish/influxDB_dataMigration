#!/bin/bash
n=100 #numero di inserimenti di default
if [ "$2" != "" ];
then
n=$2
fi
timestamp=1434055562000000000
val=0.10|bc
for (( i=0 ; $i < $n ; i++ ))
do
echo "Query "$i
timestamp=$((timestamp+1000000000))
s=0.01|bc
val=$(awk "BEGIN {print $val+0.01; exit}")
curl='/usr/bin/curl'
args="-i -XPOST"
address="http://$1:8086/write?db=mydb"
options="--data-binary"
query="table1,host=server01,region=us-west value="
$curl $args $address $options "$query$val $timestamp"
#echo $curl $args $address $options $query$val $timestamp
done
