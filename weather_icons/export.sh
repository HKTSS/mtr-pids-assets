#!/bin/bash

mkdir -p exported/png_bg
mkdir -p exported/png_no_bg
mkdir -p exported/svg_bg
mkdir -p exported/svg_no_bg

for filepath in *.svg; do
	filename=${filepath##*/}
	filename=${filename%.*}
	echo Exporting $filename...
	inkscape $filepath -o "exported/png_bg/$filename.png"
	inkscape $filepath --select="rect3330" --actions=delete -o "exported/png_no_bg/$filename.png"
	inkscape $filepath --export-plain-svg --actions="select-all:all;object-to-path" -o "exported/svg_bg/$filename.svg"
	inkscape $filepath --export-plain-svg --actions="select-all:all;object-to-path;select-clear;select-by-id:rect3330;delete" -o "exported/svg_no_bg/$filename.svg"
done
