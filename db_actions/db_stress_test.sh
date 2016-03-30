#!/bin/bash
host=$1
file=$2

curl='/usr/bin/curl'
args1="-G"
address1="http://$1:8086/query"
options1="--data-urlencode"
args2="-i -XPOST"
options2="--data-binary"
query2="@"$file

for((i=0; i <= 2; ++i))
do
  database="a"$i
  query1="q=CREATE DATABASE "$database
  address2="http://$1:8086/write?db="$database
  $curl $args1 $address1 $options1 "$query1"
  $curl $args2 $address2 $options2 "$query2"
done
