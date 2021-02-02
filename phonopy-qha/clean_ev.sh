#!/bin/bash -l

cd 0
rm CHG* REPORT WAVECAR
rm qha.e* qha.o* qha.pe* qha.po*
cd ../

for NUM in {1..5} #must be consistent with volumes.sh
do
        cd $NUM-
        rm CHG* REPORT WAVECAR
        rm qha.e* qha.o* qha.po* qha.pe*
        cd ../
done

for NUM in {1..5} #must be consistent with volumes.sh
do
        cd $NUM+
        rm CHG* REPORT WAVECAR
        rm qha.e* qha.o* qha.po* qha.pe*
        cd ../
done
