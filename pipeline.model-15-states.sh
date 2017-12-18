#!/bin/bash

mkdir segmentations/
export _JAVA_OPTIONS="-Xmx4G"
for prefix in $(ls metadata.*.txt | sed 's/metadata.//g' | sed 's/.txt//g');
do
    echo "mkdir segmentations/"$prefix"/" > segment."$prefix".sh
    echo "java -jar "$ch_home"/ChromHMM.jar MakeSegmentation models_reorder/rep1/model_15.txt binaries/"$prefix"/ segmentations/"$prefix"/" >> segment."$prefix".sh
    qsub -cwd -V -l ram.c=5G segment."$prefix".sh
done
