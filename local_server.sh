#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate functionary

#NAME=functionary-medium-v2.4-AWQ
NAME=functionary-small-v2.5
TL_PL=1

model_path=/media/home/hangyu5/Documents/Hugging-Face/meetkai/$NAME
#model_names="gpt-3.5-turbo" #,gpt-4,gpt-4o,deepseek-chat,$NAME
model_names="gpt-4o" 

CUDA_VISIBLE_DEVICES=0 python3 server_vllm.py --model $model_path --host 127.0.0.1 --port 5051 --max-model-len 8192 --served-model-name $model_names --tensor-parallel-size $TL_PL