#!/bin/bash

ORIGINAL_FOLDER=$(pwd)
echo "Original: "$ORIGINAL_FOLDER

#TODO create folder "converted2Pdf" if not already existant

FILE="${ORIGINAL_FOLDER}/${1}.pdf"

if [[ -f $FILE ]];
then
    echo "'$1.pdf' already exists ;)"
else
    JPEGS=$(mktemp -d)
	echo "Temp: "$JPEGS

	cp "$1" "$JPEGS/$1"
	cd "$JPEGS"

	if [ ${1: -4} == ".cbr" ]
	then
		extension=.cbr
		unrar e "$1"
	else
		extension=.cbz
		unzip -j "$1" -d "$JPEGS"
	fi

	ls -1 ./*jp*g | xargs -L1 -I {} img2pdf {} -o {}.pdf
	pdftk *.pdf cat output combined.pdf
	
	#remove .cbr to get .pdf only
	filename=$(basename "$1" $extension)
	cp "combined.pdf" "$ORIGINAL_FOLDER/$filename.pdf"
	cd ..

	# cleanup
	rm -R $JPEGS
	rm "${ORIGINAL_FOLDER}/${1}"
fi


