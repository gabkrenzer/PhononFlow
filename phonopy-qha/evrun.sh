#!/bin/bash -l

echo 0
cd 0
mv POSCAR-0 POSCAR
mv KPOINTS_ev KPOINTS
mv INCAR_ev INCAR
qsub myjobfile.job
cd ../
sleep 1

for NUM in {1..5} #must be consistent with volumes.sh/directory names
do
   echo $NUM-
   cd $NUM-
   mv POSCAR--$NUM POSCAR
   mv KPOINTS_ev KPOINTS
   mv INCAR_ev INCAR
   qsub myjobfile.job
   cd ../
   sleep 1
done

for NUM in {1..5} #must be consistent with volumes.sh/directory names
do
   echo $NUM+
   cd $NUM+
   mv POSCAR-$NUM POSCAR
   mv KPOINTS_ev KPOINTS
   mv INCAR_ev INCAR
   qsub myjobfile.job
   cd ../
   sleep 1
done

