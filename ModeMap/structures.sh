#!/bin/bash -l

for NUM in X Y Z #update with the modes of interest, e.g 1 5 6 for modes 1, 5, and 6 
do
	echo $NUM
	mkdir $NUM
	cp ModeMap* POSCAR FORCE_SETS ExtractTotalEnergies.py $NUM
	cp POTCAR KPOINTS INCAR modemap.job $NUM
	cp clean_mm.sh $NUM
 	cd $NUM
	#update the following line to your system
	python ModeMap.py -c POSCAR --dim="2 2 1" --mode="0.333333 0.333333 0 $NUM" --q_range="-6 6 0.5" --supercell="3 3 1"
	tar -xf ModeMap.tar.gz
	cd ../
	sleep 1
done
