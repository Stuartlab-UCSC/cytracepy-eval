#!/usr/bin/env bash

#expdir="3_data"
#cxbdir='3_monocle_cxb'
#odir="3_monocle_markers"

docker pull stuartlab/monocle
docker_call="docker run -v $(pwd)/data:/data stuartlab/monocle Rscript /home/src/run_markers.r" 

#for i in $(seq 1 20); do ${docker_call} ${cxbdir}/cxb_$i.tab ${expdir}/sample_$i.tab ${odir}/markers_$i.tab; done


#expdir="13_data"
#cxbdir='13_monocle_cxb'
#odir="13_monocle_markers"

#for i in $(seq 1 20); do ${docker_call} ${cxbdir}/cxb_$i.tab ${expdir}/sample_$i.tab ${odir}/markers_$i.tab; done

expdir="3_data"
cxbdir='3_dpt_cxb'
odir="3_dpt_markers"

docker_call="docker run -v $(pwd)/data:/data stuartlab/monocle Rscript /home/src/run_markers.r"

for i in $(seq 1 20); do ${docker_call} ${cxbdir}/cxb_$i.tab ${expdir}/sample_$i.tab ${odir}/markers_$i.tab; done


expdir="13_data"
cxbdir='13_dpt_cxb'
odir="13_dpt_markers"

for i in $(seq 1 20); do ${docker_call} ${cxbdir}/cxb_$i.tab ${expdir}/sample_$i.tab ${odir}/markers_$i.tab; done

