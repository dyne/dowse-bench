# File composition

.
├── compare-dns-plot.plt
├── dns-external_bench.sh
├── dns-internal_bench.sh
├── dns-record.txt
├── Makefile
├── plot.plt
├── README.md
├── result
....
├── webui-bench.sh
└── wrk
...


# Results

## dns-external_bench.sh
The tool dns-external_bench.sh is useful to check the level of Quality-of-Service of DNS infrastructure.

The script harvest the data and plot a graph with the distribution of time to response.

The script, ./compare-dns-plot.plt is useful to compare the result of the intranet DNS testing and extranet DNS testing.

## webui_bench.sh

The webui_bench.sh measure the response of the dowse.it page, with various worload samples and client configurations.
The result of this test are stored in file with name like:
 result/result-${T}-${C}-${D}.data

where:
* ${T} is the number of client's thread running simultaneously.
* ${C} is the number of total connection keep alived simultaneously.


To view the data we provided the script : 


