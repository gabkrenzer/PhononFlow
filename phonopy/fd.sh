#!/bin/bash -l

for NUM in {001..XXX} #update with the number of POSCAR-XXX generated
do
   echo $NUM
   mkdir $NUM
   cp -r INCAR POTCAR KPOINTS ./$NUM/
   cp POSCAR-$NUM $NUM/POSCAR
   cp phonon.job $NUM/
   cd  $NUM
   qsub phonon.job #it is recommended to test convergence/paralellisation before submitting all jobs
   cd ../
   sleep 1
done
