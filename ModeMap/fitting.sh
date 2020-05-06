#!/bin/bash -l

for MODE in 1 #update with the number of modes of interest
do
	echo $MODE
	cp ModeMap_PolyFit.py $MODE
	cd $MODE
	python ModeMap_PolyFit.py --degree=6 #update for your needs
	cd ../
	sleep 1 
done
