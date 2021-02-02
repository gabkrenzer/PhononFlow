#/bin/bash -l
#this script runs single point calculations for all MPOSCARs excpet the two extreme and the equilibrium structures

for MODE in X Y Z #update with the number of modes that are of interest
do
	cd $MODE
	echo MODE $MODE

	for NUM in {002..YYY} #update with the number of MPOSCAR
	do
		echo $NUM 
   		cd  $NUM
		qsub modemap.job
   		cd ../
   		sleep 1
	done
	for NUM in {(YYY+2)..XXX} #update with the number of MPOSCAR
	do
		echo $NUM 
   		cd  $NUM
		qsub modemap.job
   		cd ../
   		sleep 1
	done
done
