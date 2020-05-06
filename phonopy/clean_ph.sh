#!/bin/bash -l

for NUM in {001..004}
do
	cd $NUM
	rm CHG* REPORT 
	rm WAVECAR CONTCAR
	rm phonon.e* phonon.o* phonon.po* phonon.pe*
	cd ../
done


