#!/bin/bash
#maxproc limits the number of processes
maxproc=5


for fname in *.rem.1.fq.gz
do
	while [ $(jobs | wc -l) -ge "$maxproc" ]
	do
		sleep 1
	done
	base=${fname%.rem.1*}
	echo starting new job with ongoing=$(jobs | wc -l)
	bwa mem -t 20 -M ./GCA_002849675.1_ASM284967v1_genomic.fna.gz \
	"${base}.1.fq.gz" \
	"${base}.2.fq.gz" > "./${base}.sam"
done