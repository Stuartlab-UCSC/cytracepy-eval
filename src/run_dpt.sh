#!/usr/bin/env bash

indir="3_data"
odir="3_dpt_cxb"

# make sure they are using the most recent script... should have a tag for reproducibility. 
docker pull stuartlab/dpt

docker_call="docker run -v $(pwd)/data:/data stuartlab/dpt Rscript home/src/run_method"

for i in $(seq 1 20); do ${docker_call} ${indir}/sample_$i.tab ${odir}/cxb_$i.tab cxb; done

indir="13_data"
odir="13_dpt_cxb"
for i in $(seq 1 20); do ${docker_call} ${indir}/sample_$i.tab ${odir}/cxb_$i.tab cxb; done
