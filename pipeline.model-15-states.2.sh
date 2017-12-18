#!/bin/bash

## annotate the results of the segmentation

source pipeline.header.sh

for rep in "rep1" "rep2";
do
    for f in $(ls segmentations/"$rep"/ | grep segments.bed | sed 's/_segments.bed//g');
    do
        #enrichment
        echo "java -jar "$ch_home"/ChromHMM.jar OverlapEnrichment segmentations/"$rep"/"$f"_segments.bed annotations/coords/ segmentations/"$rep"/"$f"_overlap" > anno."$f"."$rep".enrich.sh
        qsub -cwd -V -l ram.c=3G anno."$f"."$rep".enrich.sh
        #TSS neighbour
        echo "java -jar "$ch_home"/ChromHMM.jar NeighborhoodEnrichment segmentations/"$rep"/"$f"_segments.bed annotations/anchors/GencodeVM9_TSS.bed.gz segmentations/"$rep"/"$f"_GencodeVM9_TSS" > anno."$f"."$rep".tss.sh
        qsub -cwd -V -l ram.c=3G anno."$f"."$rep".tss.sh
        #TES neighbour
        echo "java -jar "$ch_home"/ChromHMM.jar NeighborhoodEnrichment segmentations/"$rep"/"$f"_segments.bed annotations/anchors/GencodeVM9_TES.bed.gz segmentations/"$rep"/"$f"_GencodeVM9_TES" > anno."$f"."$rep".tts.sh
        qsub -cwd -V -l ram.c=3G anno."$f"."$rep".tts.sh
    done
done
