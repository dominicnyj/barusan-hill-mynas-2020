#!/bin/bash
#maxproc limits the number of processes
maxproc=3

for fname in *.sam
do
	while [ $(jobs | wc -l) -ge "$maxproc" ]
	do
		sleep 1
	done
	base=${fname%.sam*}
	echo starting new job with ongoing=$(jobs | wc -l)
	samtools view -bShq 20 -@ 8 ${base}.sam > ./${base}.bam
	samtools sort -m 4G -@ 8 ./${base}.bam > ./${base}.bam
done