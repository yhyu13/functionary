#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate functionary

#NAME=meetkai/functionary-medium-v2.4-AWQ
#NAME=meetkai/functionary-small-v2.5
NAME=meetkai/functionary-small-v3.2
#NAME=THUDM/glm-4-9b-chat


model_path=/media/home/hangyu5/Documents/Hugging-Face/$NAME
#model_names="gpt-3.5-turbo" #,gpt-4,gpt-4o,deepseek-chat,$NAME
model_names="gpt-4o" 

# TL_PL=2
# CUDA_VISIBLE_DEVICES=0,1 python3 server_vllm.py --model $model_path --host 127.0.0.1 --port 5051 --max-model-len 8192 --served-model-name2 $model_names --tensor-parallel-size $TL_PL --trust-remote-code --enforce-eager

TL_PL=1
CUDA_VISIBLE_DEVICES=0 python3 server_vllm.py --model $model_path --host 127.0.0.1 --port 5051 --max-model-len 8192 --served-model-name2 $model_names --tensor-parallel-size $TL_PL --trust-remote-code --enforce-eager