#!/bin/bash

file_to_convert="${1}"
output_file="${2}"

pdftohtml "${file_to_convert}" "${output_file}"
