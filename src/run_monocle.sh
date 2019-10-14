#!/usr/bin/env bash

indir="3_data"
odir="3_monocle_cxb"

docker pull stuartlab/monocle

docker_call="docker run -v $(pwd)/data:/data stuartlab/monocle run_method"

for i in $(seq 1 20); do ${docker_call} ${indir}/sample_$i.tab ${odir}/cxb_$i.tab cxb; done


indir="13_data"
odir="13_monocle_cxb"
for i in $(seq 1 20); do ${docker_call} ${indir}/sample_$i.tab ${odir}/cxb_$i.tab cxb; done
