#!/bin/bash

file_to_convert="${1}"
output_folder="${2}"

libreoffice --headless --convert-to htm:HTML --outdir "${output_folder}" "${file_to_convert}"

