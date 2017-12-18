#!/bin/bash

mkdir binaries/
for prefix in $(ls metadata.*.txt | sed 's/metadata.//g' | sed 's/.txt//g');
do
    mkdir binaries/"$prefix"/
    echo "export _JAVA_OPTIONS=\"-Xmx16G\"" > binarize."$prefix".sh
    echo "java -jar "$ch_home"/ChromHMM.jar BinarizeBam "$ch_home"/CHROMSIZES/mm10.txt "$data_home" metadata."$prefix".txt binaries/"$prefix"/" >> binarize."$prefix".sh
    qsub -cwd -V -l ram.c=18G binarize."$prefix".sh
done
