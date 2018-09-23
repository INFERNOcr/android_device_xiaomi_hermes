#!/bin/sh

echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="build/make/core build/soong frameworks/base frameworks/av hardware/interfaces system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo -e "\n Cleaning $dir patches...\n"
	git checkout -- . && git clean -df
done

# -----------------------------------
echo -e "Done !\n"
cd $rootdirectory
