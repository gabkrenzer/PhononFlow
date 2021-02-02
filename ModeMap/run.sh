#/bin/bash -l
#this script runs single point calculations for all MPOSCARs excpet the two extreme and the equilibrium structures

for MODE in X Y Z #update with the number of modes that are of interest
do
	cd $MODE
	echo MODE $MODE

	for NUM in {002..(EQ-1)} #update with the number of MPOSCAR; from 002 to equilibrium-1
	do
		echo $NUM 
   		cd  $NUM
		qsub modemap.job
   		cd ../
   		sleep 1
	done
	for NUM in {(EQ+1)..(MAX-1)} #update with the number of MPOSCAR; from equilibrium+1 to MAX-1
	do
		echo $NUM 
   		cd  $NUM
		qsub modemap.job
   		cd ../
   		sleep 1
	done
done
