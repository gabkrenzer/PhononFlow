#!/bin/bash -l

for MODE in 1 
do
	echo $MODE
	cp ModeMap_PolyFit.py $MODE
	cd $MODE
	python ModeMap_PolyFit.py --degree=6 
	cd ../
	sleep 1 
done
