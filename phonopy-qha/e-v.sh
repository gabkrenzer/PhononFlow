#!/bin/bash -l
#again this is a little overcomplicated or what it is supposed to do
#I am thinking about switching to python for this

echo '' > e-v.dat
echo '# cell volume   energy of cell other than phonon' >> e-v.dat

for i in {1..5} #must be consistent with volumes.sh
do
        MINUS=`echo "6-$i" | bc` #start from 5 to 1; if different for loop update as "(MAX+1)-$i"
        cd $MINUS-
        VOLUME="$(grep 'volume of cell' OUTCAR | head -n 1 | grep -o '[0-9]\{2\}.[0-9]\{2\}')"
        ENERGY="$(grep 'E0' OSZICAR | tail -n 1 | grep -o '.[0-9]\{8\}E+[0-9]\{2\}' | tail -n 1)"
        cd ..
        echo "$VOLUME -$ENERGY" >> e-v.dat
done

cd 0
VOLUME="$(grep 'volume of cell' OUTCAR | head -n 1 | grep -o '[0-9]\{2\}.[0-9]\{2\}')"
ENERGY="$(grep 'E0' OSZICAR | tail -n 1 | grep -o '.[0-9]\{8\}E+[0-9]\{2\}' | tail -n 1)"
cd ..
echo "$VOLUME -$ENERGY" >> e-v.dat

for PLUS in {1..5} #must be consistent with volumes.sh
do
        cd $PLUS+
        VOLUME="$(grep 'volume of cell' OUTCAR | head -n 1 | grep -o '[0-9]\{2\}.[0-9]\{2\}')"
        ENERGY="$(grep 'E0' OSZICAR | tail -n 1 | grep -o '.[0-9]\{8\}E+[0-9]\{2\}' | tail -n 1)"
        cd ..
        echo "$VOLUME -$ENERGY" >> e-v.dat
done
