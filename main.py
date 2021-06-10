#!/usr/bin/env python3

import os
import sys
import time
import argparse
import subprocess

def main(vzeit, tzeit):

    zeit_iter = vzeit/tzeit
    #with open("RAM.out", "w") as stream_aus:

    #stream_aus.write("Time(s)  Used RAM (GB)  Free RAM(GB) \n")
    for i in range(int(zeit_iter)):
        aus_d = open("tmp.dat","w")
        subprocess.call(["free","-g"], stdout=aus_d)

        with open("tmp.dat", "r") as stream:
            free_d = []
            for line in stream:
                free_d.append(line.split())
            nutz_RAM = float((free_d[1])[2])
            frei_RAM = float((free_d[1])[3])

        if os.path.isfile("./RAM.out") == True:
            stream_aus = open("RAM.out", "a")
            stream_aus.write("{:2.1f} {:12.1f} {:14.1f}\n".format(tzeit*(i+1), nutz_RAM, frei_RAM))
        elif os.path.isfile("./RAM.out") == False:
            stream_aus = open("RAM.out", "w")
            stream_aus.write("{:2.1f} {:12.1f} {:14.1f}\n".format(tzeit*(i+1), nutz_RAM, frei_RAM))

        if i < (zeit_iter - 1):
            time.sleep(tzeit)
            stream_aus.close()
        else:
            subprocess.run(["rm","tmp.dat"])
            stream_aus.close()
            pass
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-vz", "--voll_zeit", help="Total time requested on the "\
                                                   "Job")
    parser.add_argument("-tz", "--teil_zeit", help="Time interval in which the RAM "\
                                                   "will be measured")
    args = parser.parse_args()
    if args.teil_zeit == None:
        tzeit = float(5)
    else:
        tzeit = args.teil_zeit

    if args.voll_zeit == None:
        vzeit = float(10)
    else:
        vzeit = args.voll_zeit

    main(float(vzeit), float(tzeit))

