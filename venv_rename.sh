#!/bin/bash

if [ $# -ne 2 ]; then echo "Usage: venv_rename.sh <src> <dest>"; fi

if [ ! $(which ag) ]; then echo "Please install the silver searcher ag package"; exit 1; fi

src=$1
dest=$2

if [ $src = $dest ]; then exit 0; fi

echo "Rename directory $src to $dest"
mv $src $dest

cd $dest

# Rename scripts' interrupter
for f in $(ag -l "/$src/"); do
	echo "Renaming $src occurs in file $f"
	sed -i "s/\/$src\//\/$dest\//g" $f
done

# Rename environmental variables in activate scripts
for f in $(find bin/ | grep -P "activate(.csh|.fish|)$"); do
    echo "Renaming $src occurs in file $f"
    line=$(grep -ne 'VIRTUAL_ENV=' $f | cut -d ':' -f 1)
    sed -i "${line}s/\/$src/\/$dest/g" $f
done

# Relink local directories
if [ -d local ]; then 
    ln -snf $(pwd)/bin local/bin
    ln -snf $(pwd)/lib local/lib
    ln -snf $(pwd)/include local/include
fi


