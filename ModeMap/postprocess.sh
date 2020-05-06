#/bin/bash -l

mkdir Results
cp fitting.sh Results
cp ModeMap_PolyFit.py Results 
for MODE in 1 #update 
do
	cd $MODE
	echo $MODE
	python ModeMap_PostProcess.py
	mv ModeMap_PostProcess.csv ../Results
	cd ../Results	
	mkdir $MODE
	mv ModeMap_PostProcess.csv $MODE
	cd ..
done
