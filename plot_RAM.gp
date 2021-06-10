reset
clear

set ls 101 lw 3 dt 1 lc 0
set ls 102 lw 3 dt 1 lc 1
set ls 1001 lw 0.8 dt '..' lc 0

set macros

set terminal pngcairo size 1024,768 enhanced font "Helvetica, 23"
set output 'RAM_nutzung_pvdz.png'

RAM_datei = "RAM_pvdz.out"

XRANGE = "[0 : 1000]"
XTICS  = "0, 100, 1000"
YRANGE = "[0 : 300]"
YTICS  = "0, 50, 300"

set tics font ",22"
set grid ls 1001
set title "TCTA PBE\\@G0W0, cc-pvdz"

set xrange @XRANGE
set xtics  @XTICS
set yrange @YRANGE
set ytics  @YTICS

set xlabel 'Time (s)'
set ylabel 'RAM (GB)'

p RAM_datei u 1:2  w l ls 101 title 'Used RAM',\
  RAM_datei u 1:3  w l ls 102 title 'Free RAM'
