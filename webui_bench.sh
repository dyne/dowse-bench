#!/bin/bash

source conf/parameter.conf


rm -f result/latency*.data
rm -f result/req_sec*.data

function header {
    OUT=$1
    label=$2
    
    cat <<EOF > ${OUT}
#!/usr/bin/gnuplot

clear
reset
set border 3
set xlabel "# connection per thread"
set ylabel "${label}"
set title "${label}"

# Add a vertical dotted line at x=0 to show centre (mean) of distribution.
set yzeroaxis

EOF

}

function first_row {
    infile=$1
    out=$2
    echo "plot '${infile}' using 1:2 w linespoints title \"${T} Thread(s)\"" >> ${out}
}

function other_row {
    infile=$1
    out=$2
    echo "replot '${infile}' using 1:2 w linespoints title \"${T} Thread(s)\"" >> ${out}
}



header ${plot_latency} "Latency"
header ${req_sec} "Request/sec"

first=0
for T in ${LISTT[@]}; do
    if [ "${first}" == "0" ]; then
	first_row result/latency-${T}.data ${plot_latency}
	first_row result/req_sec-${T}.data ${req_sec}

	first=1;
    else
	other_row result/latency-${T}.data ${plot_latency}
	other_row result/req_sec-${T}.data ${req_sec}
    fi
    
  for c in ${LISTC[@]}; do
   for D in ${LISTD[@]}; do
       C=$(( $c * $T))
       ./wrk/wrk -t$T -c$C -d${D}s ${URL_TO_BENCHMARK} 2>&1 | tee result/result-${T}-${C}-${D}.data

       grep Latency result/result-${T}-${C}-${D}.data |sed 's/[a-zA-Z]//g' | while read line ; do  echo "${C} $line" ; done >> result/latency-${T}.data
       
       grep "Req/Sec" result/result-${T}-${C}-${D}.data |sed 's|[/a-zA-Z]||g' | while read line ; do  echo "${C} $line" ; done >> result/req_sec-${T}.data
       
   done
  done
done

function ending {
    echo "pause -1" >> ${1}    
    chmod +x ${1}
    echo -e "To plot [$2] you can now execute generated file : [$1] "
}

ending ${plot_latency} "Latency"
ending ${req_sec} "Req/Sec"

