#!/bin/bash

cd "$DIR"

File_1=$(find "$DIR" -maxdepth 1 -name "*germ-pass.tsv" | head -n 1)

if [ -z "$File_1" ]; then
    echo "sample_amal.sh: no *germ-pass.tsv file found in $DIR" >&2
    exit 1
fi

char=sample
awk -v a="$char" -v b="$File_name" 'BEGIN{ FS = OFS = "\t" } { print (NR==1? a : b), $0 }' "$File_1" > tmp && mv tmp "$File_1"

if cat "$File_1" > "$DIR1/$File_name.tsv.part" && mv "$DIR1/$File_name.tsv.part" "$DIR1/$File_name.tsv"; then
    rm "$File_1"
else
    echo "sample_amal.sh: FAILED copying $File_1 to $DIR1/$File_name.tsv -- leaving source intact" >&2
    rm -f "$DIR1/$File_name.tsv.part"
    exit 1
fi

