#!/bin/bash

curl='/usr/bin/curl'
args="-i -XPOST"
address="http://$1:8086/write?db=mydb"
options="--data-binary"
query="@$2"
echo $curl $args $address $options $query
$curl $args $address $options $query
