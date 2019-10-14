#!/usr/bin/env bash

mToM="monocle-monocle"
mToD="monocle-dpt"
dToD="dpt-dpt"

sameData="same"
diffData="different"

cytracepy="/home/duncan/work/trajectory/cytracepy"
dist_call="python3 -W ignore $(pwd)/cleaned_up_scrs/mark_inters_distance.py"

source /home/duncan/work/trajectory/cytracepy/env/bin/activate

export PYTHONPATH=${PYTHONPATH}:${cytracepy}

ofile="data/dist_normed.marker.tab"

########################
fdatadir="data/13_data"
qdatadir="data/13_data"
fcxbdir="data/13_monocle_cxb"
qcxbdir="data/13_dpt_cxb"
markerdir="data/13_monocle_markers"


echo $qdatadir $markerdir
for i in $(seq 1 20)
do
        echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${dist_call} \
                        -cf ${fcxbdir}/cxb_$i.tab \
                        -cq ${qcxbdir}/cxb_$j.tab \
                        -ff ${fdatadir}/sample_$i.tab \
                        -fq ${qdatadir}/sample_$j.tab \
                        -m ${markerdir}/markers_$i.tab \
                        -o ${ofile} \
                        -e1 $mToD \
                        -e2 $sameData \
                        & wait
                fi
        done
done

#########################
datadir="data/3_data"
cxbdir="data/3_monocle_cxb"
markerdir="data/3_monocle_markers"


echo $datadir $markerdir
for i in $(seq 1 20) 
do 
	echo $i
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
			-e1 $mToM \
			-e2 $sameData \
			& wait 
		fi
	done 
done
#######################
fdatadir="data/3_data"
qdatadir="data/13_data"
fcxbdir="data/3_monocle_cxb"
qcxbdir="data/13_dpt_cxb"
markerdir="data/3_monocle_markers"

echo $qdatadir $markerdir
for i in $(seq 1 20)
do
	echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${dist_call} \
                        -cf ${fcxbdir}/cxb_$i.tab \
                        -cq ${qcxbdir}/cxb_$j.tab \
                        -ff ${fdatadir}/sample_$i.tab \
                        -fq ${qdatadir}/sample_$j.tab \
                        -m ${markerdir}/markers_$i.tab \
                        -o ${ofile} \
			-e1 $mToD \
                        -e2 $diffData \
                        & wait
                fi
        done
done
####################
fdatadir="data/13_data"
qdatadir="data/3_data"
fcxbdir="data/13_monocle_cxb"
qcxbdir="data/3_dpt_cxb"
markerdir="data/13_monocle_markers"

echo $qdatadir $markerdir
for i in $(seq 1 20)
do
	echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${dist_call} \
                        -cf ${fcxbdir}/cxb_$i.tab \
                        -cq ${qcxbdir}/cxb_$j.tab \
                        -ff ${fdatadir}/sample_$i.tab \
                        -fq ${qdatadir}/sample_$j.tab \
                        -m ${markerdir}/markers_$i.tab \
                        -o ${ofile} \
			-e1 $mToD \
                        -e2 $diffData \
                        & wait
                fi
        done
done




####################
fdatadir="data/13_data"
qdatadir="data/3_data"
fcxbdir="data/13_monocle_cxb"
qcxbdir="data/3_monocle_cxb"
markerdir="data/13_monocle_markers"

echo $qdatadir $markerdir
for i in $(seq 1 20)
do
	echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${dist_call} \
                        -cf ${fcxbdir}/cxb_$i.tab \
                        -cq ${qcxbdir}/cxb_$j.tab \
                        -ff ${fdatadir}/sample_$i.tab \
                        -fq ${qdatadir}/sample_$j.tab \
                        -m ${markerdir}/markers_$i.tab \
                        -o ${ofile} \
			-e1 $mToM \
                        -e2 $diffData \
                        & wait
                fi
        done
done




####################
fdatadir="data/13_data"
qdatadir="data/3_data"
fcxbdir="data/13_dpt_cxb"
qcxbdir="data/3_dpt_cxb"
markerdir="data/13_dpt_markers"

echo $qdatadir $markerdir
for i in $(seq 1 20)
do
	echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${dist_call} \
                        -cf ${fcxbdir}/cxb_$i.tab \
                        -cq ${qcxbdir}/cxb_$j.tab \
                        -ff ${fdatadir}/sample_$i.tab \
                        -fq ${qdatadir}/sample_$j.tab \
                        -m ${markerdir}/markers_$i.tab \
                        -o ${ofile} \
			-e1 $dToD \
                        -e2 $diffData \
                        & wait
                fi
        done
done

###################
datadir="data/13_data"
cxbdir="data/13_dpt_cxb"
markerdir="data/13_dpt_markers"

echo $datadir $markerdir
for i in $(seq 1 20)
do
	echo $i
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
			-e1 $dToD \
                        -e2 $sameData \
                        & wait
                fi
        done
done

