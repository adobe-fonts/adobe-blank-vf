#!/usr/bin/env sh

# Adobe Blank VF

buildmasterotfs --mkot -omitMacNames AdobeBlankVF.designspace
buildcff2vf -p AdobeBlankVF.designspace
sfntedit -a cmap=cmap-4+12.bin,name=Blank/name.bin,GSUB=GSUB.bin,OS/2=OS2.bin AdobeBlankVF.otf
woff2_compress AdobeBlankVF.otf

# Adobe Black VF

buildmasterotfs --mkot -omitMacNames AdobeBlackVF.designspace
buildcff2vf -p AdobeBlackVF.designspace
tx -cff2 +S AdobeBlackVF.otf AdobeBlackVF.cff2
sfntedit -a cmap=cmap-4+12.bin,name=Black/name.bin,GSUB=GSUB.bin,OS/2=OS2.bin,CFF2=AdobeBlackVF.cff2 AdobeBlackVF.otf
woff2_compress AdobeBlackVF.otf

# Adobe Blank 2 VF

buildmasterotfs --mkot -omitMacNames AdobeBlank2VF.designspace
buildcff2vf -p AdobeBlank2VF.designspace
sfntedit -a cmap=cmap-13.bin,name=Blank2/name.bin,GSUB=GSUB.bin,OS/2=OS2.bin AdobeBlank2VF.otf
woff2_compress AdobeBlank2VF.otf

# Adobe Black 2 VF

buildmasterotfs --mkot -omitMacNames AdobeBlack2VF.designspace
buildcff2vf -p AdobeBlack2VF.designspace
sfntedit -a cmap=cmap-13.bin,name=Black2/name.bin,GSUB=GSUB.bin,OS/2=OS2.bin AdobeBlack2VF.otf
woff2_compress AdobeBlack2VF.otf

# EOF
