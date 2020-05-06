#/bin/bash -l

for MODE in 1 #update with the number of modes that are of interest
do
	cd $MODE
	echo MODE $MODE

	for NUM in {001..025} #update with the number of MPOSCAR generated
	do
		echo $NUM  
   		mkdir $NUM 
   		cp INCAR POTCAR ./$NUM/
   		cp KPOINTS ./$NUM/
   		mv MPOSCAR-$NUM $NUM/POSCAR
   		cp modemap.job $NUM/
   		cp clean_mm.sh $NUM/
   		cd  $NUM
   		cd ../
   		sleep 1
	done
	cd ../
done
