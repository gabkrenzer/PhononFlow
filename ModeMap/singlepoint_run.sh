#/bin/bash -l

for MODE in X Y Z #update with the number of modes that are of interest
do
	cd $MODE
	echo MODE $MODE

	for NUM in {001..XXX} #update with the number of MPOSCAR generated
	do
		echo $NUM  
   		mkdir $NUM 
   		cp INCAR POTCAR ./$NUM/
   		cp KPOINTS ./$NUM/
   		mv MPOSCAR-$NUM $NUM/POSCAR
   		cp modemap.job $NUM/
   		cp clean_mm.sh $NUM/
   		cd  $NUM
   		qsub modemap.job
   		cd ../
   		sleep 1
	done
	cd ../
done
