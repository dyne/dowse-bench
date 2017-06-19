#!/usr/bin/gnuplot

clear
reset
set border 3
set xlabel "Time (msec)"
set ylabel "Frequency"
set title "DNS query, time distribution"

set xrange [1:]

# Add a vertical dotted line at x=0 to show start of distribution.
set yzeroaxis
set logscale x

# Each bar is half the (visual) width of its x-range.
set boxwidth 0.5 absolute
set style fill solid 1.0 noborder

bin_width = 1.;

bin_number(x) = floor(x/bin_width)

rounded(x) = bin_width * ( bin_number(x)  )

plot 'result/res.data' using (rounded($4)):(4) smooth frequency with boxes title "DNS query" 

pause -1 "Press any key to continue"


