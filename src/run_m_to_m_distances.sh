#!/usr/bin/env bash

cytracepy="/home/duncan/work/trajectory/cytracepy"
datadir="data/3_data"
cxbdir="data/3_monocle_cxb"
ofile="data/3_m_to_m_dist.tab"
markerdir="data/3_monocle_markers"
indecies_file="data/3_m_to_m_indecies.tab"

source ${cytracepy}/env/bin/activate

export PYTHONPATH=${PYTHONPATH}:${cytracepy}
dist_call="python3 -m cytracepy"

for i in $(seq 1 20) 
do 
	for j in $(seq 1 20) 
	do
		if [ $i -ne $j ]
		then	
		${dist_call} \
			-cf ${cxbdir}/cxb_$i.tab \
			-cq ${cxbdir}/cxb_$j.tab \
			-ff ${datadir}/sample_$i.tab \
			-fq ${datadir}/sample_$j.tab \
			-m ${markerdir}/markers_$i.tab \
			-o ${ofile} \
			& echo -e $i'\t'$j >> ${indecies_file} & echo $i-$j & wait 
		fi
	done 
done

datadir="data/13_data"
cxbdir="data/13_monocle_cxb"
ofile="data/13_m_to_m_dist.tab"
markerdir="data/13_monocle_markers"
indecies_file="data/13_m_to_m_indecies.tab"

for i in $(seq 1 20)
do
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${dist_call} \
                        -cf ${cxbdir}/cxb_$i.tab \
                        -cq ${cxbdir}/cxb_$j.tab \
                        -ff ${datadir}/sample_$i.tab \
                        -fq ${datadir}/sample_$j.tab \
                        -m ${markerdir}/markers_$i.tab \
                        -o ${ofile} \
                        & echo -e $i'\t'$j >> ${indecies_file} & echo $i-$j & wait
                fi
        done
done

