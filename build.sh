#!/usr/bin/env sh

# Get the absolute path to the bash script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function build_var_fonts {

	dsgnsp_file=$DIR/$1.designspace
	otf_file=$DIR/$1.otf
	ttf_file=$DIR/$1.ttf

	buildmasterotfs --mkot -omitMacNames $dsgnsp_file
	buildcff2vf --omit-mac-names -d $dsgnsp_file

	if [ $1 == 'AdobeBlackVF' ]
	then
		tx -cff2 +S $otf_file $1.cff2
		sfntedit -a CFF2=$1.cff2,GSUB=GSUB.bin,OS/2=OS2.bin,cmap=cmap-4+12.bin $otf_file
		rm $1.cff2
	elif [ $1 == 'AdobeBlankVF' ]
	then
		sfntedit -a GSUB=GSUB.bin,OS/2=OS2.bin,cmap=cmap-4+12.bin $otf_file
	else
		sfntedit -a GSUB=GSUB.bin,OS/2=OS2.bin,cmap=cmap-13.bin $otf_file
	fi

	# The fontTools.feaLib does not yet support the 'vhea' and 'vmtx'
	# tables, so the TrueType font must be built without their features
	# file override code
	fontmake -m $dsgnsp_file -o variable --output-path $ttf_file

	# Copy 'GSUB', 'OS/2', 'STAT', 'VVAR', 'cmap', 'name', 'vhea', and
	# 'vmtx' tables from OTF to TTF
	sfntedit -x GSUB=.tb_GSUB,OS/2=.tb_OS2,STAT=.tb_STAT,VVAR=.tb_VVAR,cmap=.tb_cmap,name=.tb_name,vhea=.tb_vhea,vmtx=.tb_vmtx $otf_file
	sfntedit -a GSUB=.tb_GSUB,OS/2=.tb_OS2,STAT=.tb_STAT,VVAR=.tb_VVAR,cmap=.tb_cmap,name=.tb_name,vhea=.tb_vhea,vmtx=.tb_vmtx $ttf_file

	# Nuke the build artifacts
	rm .tb_*

	# Build WOFF2 versions of the OTF and TTF
        fonttools ttLib.woff2 compress $otf_file
	mv $1.woff2 $otf_file.woff2
        fonttools ttLib.woff2 compress $ttf_file
	mv $1.woff2 $ttf_file.woff2

}

build_var_fonts AdobeBlankVF
build_var_fonts AdobeBlackVF
build_var_fonts AdobeBlank2VF
build_var_fonts AdobeBlack2VF

# EOF
