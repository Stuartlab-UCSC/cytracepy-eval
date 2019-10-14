#!/usr/bin/env bash

nohup ./run_dpt.sh 3_data 3_dpt_cxb &

nohup ./run_dpt.sh 13_data 13_dpt_cxb &

nohup ./run_monocle.sh 3_data 3_monocle_cxb &

nohup ./run_monocle.sh 13_data 13_monocle_cxb &
