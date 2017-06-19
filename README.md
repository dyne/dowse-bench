# File composition

```
.
├── compare-dns-plot.plt # a script to plot the comparison between internal and external DNS performance.
├── dns-external_bench.sh
├── dns-internal_bench.sh
├── Makefile
├── plot_distribution.plt
├── README.md
├── result
.... # contains the file recorded during benchmark execution
├── conf
├── parameter.conf # contains the parameter useful to change the testing target
├── input
├── dns-record.txt  # contains a recording session take subscribing from dns-query-channel (the Dowse channel)
├── plot # contains automatically generated file to plot data
├── webui-bench.sh # a stress script 
└── wrk
...
```

# How to use it.

```
make test
```

# Subtools

## dns-external_bench.sh

The tool dns-external_bench.sh is useful to check the level of Quality-of-Service of DNS infrastructure.

The script harvest the data and plot a graph with the distribution of time to response.

The script, ./compare-dns-plot.plt is useful to compare the result of the intranet DNS testing and extranet DNS testing.

## webui_bench.sh

The webui_bench.sh measure the response of the dowse.it page, with various workload samples and client configurations.
The result of this test are stored in file named likes:
 result/result-${T}-${C}-${D}.data

of :
* ${T} is the number of client's thread running simultaneously.
* ${C} is the number of total connection keep alived simultaneously.


To view the data the system will generates, use the script plot/plot_latency.plt and plot/req_sec.plt .


