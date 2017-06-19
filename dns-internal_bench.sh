#!/bin/bash

source conf/parameter.conf 
N=$(grep "DNS" ${DNS_RECORD_FILE} |wc -l |awk '{print $1}')
for ((i=0;i<$N;i++)); do
    dig ${DNS_INTERNAL_URL} |grep Query ;
done | tee result/res.data
cp result/res.data result/dns-internal_result.data

./plot_distribution.plt

echo "Execute [./plot_distribution.plt] to view this result"
