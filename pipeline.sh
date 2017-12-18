#!/bin/bash

##
#
source pipeline.header.sh

#
mkdir "$data_home"

## download and rename the bam files from the ENCODE DCC
#
./pipeline.download.sh
mv *.bam "$data_home"

## binarize bam files
#
./pipeline.binarize.sh

## learn models [2-24 states]
#
./pipeline.learn.sh

## segment the genome according to a 15-states model
#
./pipeline.model-15-states.sh
