#!/bin/bash

# USAGE: Run this script in the directory containing cbr|cbz files!
baseDir=$(dirname "$0")

# TODO add feature "delete source file -> -d as option ($1) for this script"
#
# Not much XP with XARGS. Need to get more infos how to xtend
# 'xargs -L1 -I{} $baseDir/cb2pdf.sh {}' correctly

# running cb2pdf.sh using filtered list of parameters:
# filtering: for cbr | cbz files -> "[cbr|cbz]$"
tree -fai . | grep -P "[cbr|cbz]$" | xargs -L1 -I{} $baseDir/cb2pdf.sh {}
