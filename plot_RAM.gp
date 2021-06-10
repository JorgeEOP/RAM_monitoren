reset
clear

set ls 101 lw 3 dt 1 lc 0
set ls 102 lw 3 dt 1 lc 3
set ls 1001 lw 0.8 dt '..' lc 0

set macros

set terminal pngcairo size 1024,768 enhanced font "Helvetica, 23"
#set output 'RAM_nutzung_pvdz_pbe_tcta_250G.png'
#set output 'RAM_nutzung_pvtz_pbe_tcta_250G.png'
#set output 'RAM_nutzung_pvtz_pbe_tcta_450G.png'
set output 'RAM_nutzung_pvqz_pbe_tcta_650G.png'

#RAM_datei = "RAM.out"
#RAM_datei = "RAM_pvdz_pbe_tcta_250G.out"
#RAM_datei = "RAM_pvtz_pbe_tcta_250G.out"
#RAM_datei = "RAM_pvtz_pbe_tcta_450G.out"
RAM_datei = "RAM_pvqz_pbe_tcta_650G.out"

XRANGE = "[0 : 1000]"
XTICS  = "0, 100, 1000"
YRANGE = "[0 : 1000]"
YTICS  = "0, 100, 1000"

set tics font ",22"
set grid ls 1001
set key top right opaque font ",22" samplen 1
set label at 100, 950 "Crashed" textcolor rgb "#CD2626" front font ",25"
#set label at 100, 950 "Succeed" textcolor rgb "#CD2626" front font ",25"

#set title "TCTA: G0W0\\@PBE, cc-pvdz"
#set title "TCTA: G0W0\\@PBE, cc-pvtz"
set title "TCTA: G0W0\\@PBE, cc-pvqz"

set xrange @XRANGE
set xtics  @XTICS
set yrange @YRANGE
set ytics  @YTICS

set xlabel 'Time (s)'
set ylabel 'RAM (GB)'

p RAM_datei u 1:2  w l ls 101 title 'Used RAM',\
  RAM_datei u 1:3  w l ls 102 title 'Free RAM'
