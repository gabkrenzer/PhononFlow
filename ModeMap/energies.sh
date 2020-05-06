#/bin/bash -l

for MODE in 1 #update with the number of modes that are of interest
do
	cd $MODE
	echo $MODE
	python ExtractTotalEnergies.py
	for NUM in {001..021} #update with the number of MPOSCAR generated
	do	
		cd $NUM
		./clean_mm.sh
		cd ..
	done
	cd ..
done
