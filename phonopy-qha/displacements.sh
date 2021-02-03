#!/bin/bash -l

echo 0
cd 0
mv POSCAR POSCAR_init
mv CONTCAR POSCAR
phonopy -d --dim="2 2 2"
cd ..

for NUM in {1..5} #must be consistent with volumes.sh/names of the directories
do
        echo $NUM-
        cd $NUM-
        mv POSCAR POSCAR_init
        mv CONTCAR POSCAR
        phonopy -d --dim="2 2 2"
        cd ..
done

for NUM in {1..5} #must be consistent with volumes.sh/names of the directories
do
        echo $NUM+
        cd $NUM+
        mv POSCAR POSCAR_init
        mv CONTCAR POSCAR
        phonopy -d --dim="2 2 2"
        cd ..
done
