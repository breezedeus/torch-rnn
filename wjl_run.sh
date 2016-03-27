#!/bin/bash
# -*- coding: utf-8 -*-

## @testreal
#ori_file_name=msg_ori
#ori_dir=/root/projects/course-text-analytics/processed_data
#extra_par=""

# @localhost
ori_file_name=msg_single
ori_dir=/Users/king/Documents/Useful_Softwares/word2vec/trunk/data
extra_par="-gpu -1"

ori_path=${ori_dir}/${ori_file_name}.txt
output_dir=output/jiayuan
output_h5_path=${output_dir}/${ori_file_name}.h5
output_json_path=${output_dir}/${ori_file_name}.json

# train
echo python scripts/preprocess.py --input_txt ${ori_path} --output_h5 ${output_h5_path} --output_json ${output_json_path}
python scripts/preprocess.py --input_txt ${ori_path} --output_h5 ${output_h5_path} --output_json ${output_json_path}

echo th train.lua -input_h5 ${output_h5_path} -input_json ${output_json_path} ${extra_par} -checkpoint_name ${ori_file_name}_cv/checkpoint -checkpoint_every 2000
nohup th train.lua -input_h5 ${output_h5_path} -input_json ${output_json_path} ${extra_par} -checkpoint_name ${ori_file_name}_cv/checkpoint -checkpoint_every 2000 &

## sample
#start_text="你 好"  # 以一个单字为一个单元
#python wjl_unicode.py "${start_text}" ${output_json_path}
#
#echo th sample.lua -checkpoint cv/checkpoint_16000.t7 -length 1000 ${extra_par}
#th sample.lua -checkpoint cv/checkpoint_16000.t7 -length 1000 ${extra_par}
