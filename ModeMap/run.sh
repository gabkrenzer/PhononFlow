#/bin/bash -l

for MODE in 1
do
	cd $MODE
	echo MODE $MODE

	for NUM in {001..025}
	do
		echo $NUM 
   		cd  $NUM
		qsub modemap.job
   		cd ../
   		sleep 1
	done
	cd ../
done
