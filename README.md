# cytracepy-eval
Scripts that were used to investigate the behaviour of the cytracepy distance function.

The presentation that was given can be found [here](https://docs.google.com/presentation/d/1iR3xLo0DC_267GFLQGH5piWyICxV7LDDyKX42GptoQ8/edit?usp=sharing/).

This work was done with high velocity and therefore organization was an afterthought. If you are interested or tasked with rerunning this analysis please contact Duncan McColl, a former employee of the stuart lab.

In silico data was derived from the prossttYY trajectory model and given to us in a collaboration with Lucas Pinello's lab. Students and staff of the stuart lab can find the entire tar'd insilico directory on the 'tap' machine at /projects/sysbio/users/cellAtlas/data/insilico-trajectory.

For this experiment, sub samples of bifurcated tree trajectories were created and compared (see presentation for clearer explanation). That data can be found in this repo in data/13_data data/3_data.

The general idea and set up was to leverage the trajectory docker containers and bash to run off all the experiments. You can see the scripts in the /src directory that fire off the dockers. Use a python virtual env and the requirments.txt file to run the standalone python scripts.
