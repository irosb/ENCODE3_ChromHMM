#!/bin/bash

## learn models [2-24 states]

source pipeline.header.sh

mkdir models/
for prefix in $(ls metadata.*.txt | sed 's/metadata.//g' | sed 's/.txt//g');
do
    mkdir models/"$prefix"/
    for ((  i = 2 ;  i <= 24;  i++  ));
    do
        echo "export _JAVA_OPTIONS=\"-Xmx16G\"" > test.learn."$prefix"."$i".sh
        echo "xvfb-run -a -n $i -e /dev/stdout java -jar "$ch_home"/ChromHMM.jar LearnModel -p 16 binaries/"$prefix"/ models/"$prefix"/ $i mm10" >> test.learn."$prefix"."$i".sh
        if [ "$i" -ge 10 ];
        then
            qsub -cwd -V -l ram.c=1.5G -pe pe_slots 16 -l h_rt=48:00:00 test.learn."$prefix"."$i".sh
        else
            qsub -cwd -V -l ram.c=1.5G -pe pe_slots 16 -l h_rt=24:00:00 test.learn."$prefix"."$i".sh
        fi
    done
done
