#!/bin/bash -l

for MODE in X Y Z #update with the number of modes of interest
do
	echo $MODE
	cd Results
	cp ModeMap_PolyFit.py $MODE
	cd $MODE
	python ModeMap_PolyFit.py --degree=N #update N to your needs
	cd ../
	sleep 1 
done
