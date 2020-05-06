#!/bin/bash -l

for NUM in {001..003}
do
   echo $NUM  
   mkdir $NUM 
   cp -r INCAR POTCAR ./$NUM/
   cp -r KPOINTS ./$NUM/
   cp POSCAR-$NUM $NUM/POSCAR
   cp phonon.job $NUM/
   cd  $NUM
   qsub phonon.job
   cd ../
   sleep 1
done
