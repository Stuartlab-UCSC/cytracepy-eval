#!/usr/bin/env bash


# args are paths inside the container.
# wishbone needs the data/ prefix
indir=$1
odir=$2

# make sure they are using the most recent script... should have a tag for reproducibility. 
docker pull stuartlab/dpt

docker_call="docker run -v $(pwd)/data:/data dmccoll/wishfix python3 /home/src/run_method.py"

for i in $(seq 1 20); do ${docker_call} -i ${indir}/sample_$i.tab -o ${odir}/cxb_$i.tab; done
