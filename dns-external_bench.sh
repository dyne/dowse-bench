#!/bin/bash
source conf/parameter.conf

echo "Work in progress..."
count=0
awk -F, '/DNS/ {print $5}' ${DNS_RECORD_FILE} |while read query ; do
				    dig $query |grep Query;
				done    | tee result/res.data
cp result/res.data result/dns-external_result.data
./plot_distribution.plt

echo "Execute [./plot_distribution.plt] to view this result"

