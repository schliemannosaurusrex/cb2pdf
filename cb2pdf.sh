#!/bin/bash

ORIGINAL_FOLDER=$(pwd)
echo "Original: "$ORIGINAL_FOLDER

#TODO create folder "converted2Pdf" if not already existant

JPEGS=$(mktemp -d)
echo "Temp: "$JPEGS

cp "$1" "$JPEGS/$1"
cd "$JPEGS"

if [ ${1: -4} == ".cbr" ]
then
    unrar e "$1"
else
    unzip -j "$1" -d "$JPEGS"
fi

ls -1 ./*jp*g | xargs -L1 -I {} img2pdf {} -o {}.pdf
pdftk *.pdf cat output combined.pdf
cp "combined.pdf" "$ORIGINAL_FOLDER/$1.pdf"
cd ..

# cleanup
rm -R $JPEGS
