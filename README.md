# cb2pdf

Comic book archive to PDF converter written for linux bash.

I'm not sure if the scripts run perfectly on all platforms, but it won't be so much effort to adapt or improve them to make 'em work everywhere.

I'm using Linux Mint and will keep it compatible with it.

## Prerequisites
You need to have following packages installed:
  ```img2pdf pdftk tree unrar unzip```

## Usage

Just run ```convertComicBookArchives2Pdf.sh``` in the folder containing the [*.cbr |*.cbz].

A PDF formatted copy of the file (including the name) with ending *.cb[r|z].pdf will be copied from "/tmp" folder (```mktemp -d```) to the original folder.

## Issues
Not yet for me. Let me know! ;)

## Changes
2021-08-15: Added: Removing .cbr extension from resulting file name now; Skipping existing target *.pdf files;
2021-08-14: Fixed bug with *.jpeg files;
