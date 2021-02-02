#!/bin/bash -l

for NUM in {001..XXX} #update with the number of XXX directories
do
        cd $NUM
        rm CHG* REPORT
        rm WAVECAR CONTCAR
        rm phonon.e* phonon.o* phonon.po* phonon.pe*
        #feel free to add anymore files here
        cd ../
done


