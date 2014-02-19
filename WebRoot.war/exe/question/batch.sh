#!/bin/bash -vx
echo "${1}"

echo 111111111111111111111111111
cd /home/apache-tomcat-7.0.42/webapps/ROOT/./exe/question/

MS_File="${1}"


Output_HTM="${2}"
Img_Folder="${3}"
echo 2222222222222222222
htm_file=${MS_File%.*}
echo ${htm_file}
echo 333333333333333333
number=$(echo ${htm_file}| grep -o '/'| wc -l)
echo 33333333333333333322222222222222

number=$[number+1]
htm_file=$(echo ${htm_file}| cut -d'/' -f${number})

echo ${htm_file}
echo 44444444444444444444444444



if grep -q PDF <(echo ${MS_File});then
./PDF2html.sh "${MS_File}" "${Img_Folder}/${htm_file}"
./IE.run "${Img_Folder}/${htm_file}s.html" ./RE.txt ./Norm.txt > ${Output_HTM}
elif grep -q pdf <(echo ${MS_File});then
./PDF2html.sh "${MS_File}" "${Img_Folder}/${htm_file}"
./IE.run "${Img_Folder}/${htm_file}s.html" ./RE.txt ./Norm.txt > ${Output_HTM}
else
./MS2html.sh "${MS_File}" "${Img_Folder}"
./IE.run "${Img_Folder}/${htm_file}.htm" ./RE.txt ./Norm.txt > ${Output_HTM}
fi
