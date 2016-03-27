ori_file_name=msg_ori
ori_dir=/root/projects/course-text-analytics/processed_data
ori_path=${ori_dir}/${ori_file_name}.txt
output_dir=output/jiayuan
output_h5_path=${output_dir}/${ori_file_name}.h5
output_json_path=${output_dir}/${ori_file_name}.json

#echo python scripts/preprocess.py --input_txt ${ori_path} --output_h5 ${output_h5_path} --output_json ${output_json_path}
#python scripts/preprocess.py --input_txt ${ori_path} --output_h5 ${output_h5_path} --output_json ${output_json_path}

echo th train.lua -input_h5 ${output_h5_path} -input_json ${output_json_path} -checkpoint_name ${ori_file_name}_cv/checkpoint
nohup th train.lua -input_h5 ${output_h5_path} -input_json ${output_json_path} -checkpoint_name ${ori_file_name}_cv256/checkpoint -checkpoint_every 2000 -dropout 0.2 -rnn_size 256 &

# sample
#th sample.lua -checkpoint cv/checkpoint_10000.t7 -length 2000

