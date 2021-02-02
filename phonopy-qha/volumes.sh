#!/bin/bash -l
#this script creates POSCAR files with new volumes
#fives smaller volumes and fiver larger volumes
#it assumes the volume of the equilibrium structure is 1.0
#this script is a little limited and I am thinking about switching to python for this task

cp POSCAR POSCAR-0
mkdir 0
cp POSCAR-0 KPOINTS POTCAR INCAR qha.job 0
echo MINUS
for MINUS in {1..5} #whatever amount you want to decrease your volume by
do
        cp POSCAR POSCAR--$MINUS
        CONT="0.0$MINUS" #here will be 0.01 to 0.05 in steps of 0.01, but this can be edited to your needs
        VOL=`echo "1 - $CONT" | bc` #so you get 0.99 to 0.95 in steps of 0.01
        sed -i "s/.*#volume/ 0$VOL/" POSCAR--$MINUS
        mkdir $MINUS-
        cp POSCAR--$MINUS KPOINTS POTCAR INCAR qha.job $MINUS-
done
echo PLUS
for PLUS in {1..5} #whatever amount you want to decrease your volume by
do
        cp POSCAR POSCAR-$PLUS
        VOL="1.0$PLUS" #here will be 1.01 to 1.05 in steps of 0.01, but this can be edited to your needs
        sed -i "s/.*#volume/ $VOL/" POSCAR-$PLUS
        mkdir $PLUS+
        cp POSCAR-$PLUS KPOINTS POTCAR INCAR qha.job $PLUS+
done
rm POSCAR-*
