#!/bin/bash -l

for NUM in {001..004} #update with the number of POSCAR-XXX generated
do
	cd $NUM
	rm CHG* REPORT 
	rm WAVECAR CONTCAR
	rm phonon.e* phonon.o* phonon.po* phonon.pe*
	#you can add up files if you want
	cd ../
done


