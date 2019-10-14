#!/bin/bash
# This script runs over a branch directory and creates *.trim files
# The first postional arg is the branch directory
# trim.sh path/to/branch/directory
dir=$1
TRIMSCR="python3 /home/ubuntu/src/trim_branches.py"
source /home/ubuntu/env/bin/activate

echo $dir
for filename in ${dir}/*; do
	$TRIMSCR -i ${filename} -o ${filename}.trim 
done
