#!/bin/bash -vx

file_to_convert="${1}"
output_file="${2}"

convert "${file_to_convert}" "${output_file}.png"
max_file_no=$(ls ${output_file}-*.png | wc -l)
if (($max_file_no == 0))
then
convert -resize 200x150 ${output_file}.png ${output_file}_small.png
convert -resize 720x540 ${output_file}.png ${output_file}_0.png
rm ${output_file}.png
else
        convert -resize 200x150 ${output_file}-0.png ${output_file}_small.png
        for ((i=0;i<max_file_no;i++))
        do
        convert -resize 720x540 ${output_file}-${i}.png ${output_file}_${i}.png
        rm ${output_file}-${i}.png
        done
fi


