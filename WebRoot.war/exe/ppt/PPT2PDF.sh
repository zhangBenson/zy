#!/bin/bash -vx

file_to_convert="${1}"
output_folder="${2}"

libreoffice --headless --invisible --convert-to pdf ${file_to_convert} --outdir ${output_folder}

