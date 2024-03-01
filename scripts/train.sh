#!/bin/bash
SECONDS=0
set -e        # exit when error
set -o xtrace # print command

GPU=$1
OUTPUT_PATH=output/
DATA_PATH=datas/tandt_db/tandt/train

# vanilla Gaussian Splatting
CUDA_VISIBLE_DEVICES=$GPU python gaussian_splatting/train.py \
    --iterations 7000 \
    -s $DATA_PATH \
    -m ${OUTPUT_PATH}

# optimize SuGaR model
CUDA_VISIBLE_DEVICES=$GPU python train.py \
    -s $DATA_PATH \
    -c $OUTPUT_PATH \
    -r sdf



















set +x; duration=SECONDS; RED='\033[0;31m'; Yellow='\033[1;33m'; Green='\033[0;32m'; NC='\033[0m'; echo -e "RED$((duration / 3600))hNC Yellow$((duration / 60 % 60))mNC Green$((duration % 60))sNC elapsed."