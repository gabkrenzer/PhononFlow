#!/bin/bash -l

for NUM in 1 #update with the number of modes of interest
do
	echo $NUM
	mkdir $NUM
	cp ModeMap* POSCAR FORCE_SETS ExtractTotalEnergies.py $NUM
	cp POTCAR KPOINTS INCAR modemap.job $NUM
	cp clean_mm.sh $NUM
 	cd $NUM
	python ModeMap.py -c POSCAR --dim="2 2 2" --mode="0 0 0 $NUM" --q_range="-1 1 0.1" --supercell="1 1 1"
	tar -xf ModeMap.tar.gz
	cd ../
	sleep 1
done
