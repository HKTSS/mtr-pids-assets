#!/bin/bash

mkdir -p exported/png_bg
mkdir -p exported/png_no_bg
mkdir -p exported/svg_bg
mkdir -p exported/svg_no_bg

for filepath in *.svg; do
	filename=${filepath##*/}
	filename=${filename%.*}
	echo Exporting $filename...
	inkscape $filepath -o "exported/png/$filename.png" -w 128 -h 128
	inkscape $filepath --export-plain-svg --actions="select-all:all;object-to-path" -o "exported/svg/$filename.svg"
done
