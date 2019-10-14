#!/usr/bin/env bash

corr_call="python3 ./cxb_corr.py"

source /home/duncan/work/trajectory/cytracepy/env/bin/activate

ofile="data/branch-corr_more-data.tab"

########################
fcxbdir="data/13_monocle_cxb"
qcxbdir="data/13_dpt_cxb"


echo $qdatadir $markerdir
for i in $(seq 1 20)
do
        echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${corr_call} \
                        -c1 ${fcxbdir}/cxb_$i.tab \
                        -c2 ${qcxbdir}/cxb_$j.tab \
			-e1 diff \
			-e2 "monocle-dpt" \
                        -o ${ofile} 
                fi
        done
done

########################
fcxbdir="data/3_monocle_cxb"
qcxbdir="data/3_dpt_cxb"


echo $qdatadir $markerdir
for i in $(seq 1 20)
do
        echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${corr_call} \
                        -c1 ${fcxbdir}/cxb_$i.tab \
                        -c2 ${qcxbdir}/cxb_$j.tab \
			-e1 diff \
			-e2 "monocle-dpt" \
                        -o ${ofile} 
                fi
        done
done

#########################
#########################
datadir="data/3_data"
cxbdir="data/3_monocle_cxb"

echo $datadir $markerdir
for i in $(seq 1 20) 
do 
	echo $i
	for j in $(seq 1 20) 
	do
		if [ $i -ne $j ]
		then	
		${corr_call} \
			-c1 ${cxbdir}/cxb_$i.tab \
			-c2 ${cxbdir}/cxb_$j.tab \
			-e1 same \
			-e2 "monocle" \
			-o ${ofile} 
		fi
	done 
done
#########################
datadir="data/13_data"
cxbdir="data/13_monocle_cxb"

echo $datadir $markerdir
for i in $(seq 1 20) 
do 
	echo $i
	for j in $(seq 1 20) 
	do
		if [ $i -ne $j ]
		then	
		${corr_call} \
			-c1 ${cxbdir}/cxb_$i.tab \
			-c2 ${cxbdir}/cxb_$j.tab \
			-e1 same \
			-e2 "monocle" \
			-o ${ofile} 
		fi
	done 
done
#######################
datadir="data/13_data"
cxbdir="data/13_dpt_cxb"

echo $datadir $markerdir
for i in $(seq 1 20)
do
	echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${corr_call} \
                        -c1 ${cxbdir}/cxb_$i.tab \
                        -c2 ${cxbdir}/cxb_$j.tab \
			-e1 same \
			-e2 "dpt" \
                        -o ${ofile} 
                fi
        done
done


#######################
datadir="data/3_data"
cxbdir="data/3_dpt_cxb"

echo $datadir $markerdir
for i in $(seq 1 20)
do
	echo $i
        for j in $(seq 1 20)
        do
                if [ $i -ne $j ]
                then
                ${corr_call} \
                        -c1 ${cxbdir}/cxb_$i.tab \
                        -c2 ${cxbdir}/cxb_$j.tab \
			-e1 same \
			-e2 dpt \
                        -o ${ofile} 
                fi
        done
done

