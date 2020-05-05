#/bin/bash -l

for MODE in 1 
do
	cd $MODE
	echo $MODE
	python ExtractTotalEnergies.py
	for NUM in {001..021}
	do	
		cd $NUM
		./clean_mm.sh
		cd ..
	done
	cd ..
done
