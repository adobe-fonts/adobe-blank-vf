# Adobe Blank VF & Friends

*Adobe Blank VF & Friends* are a set of special-purpose Variable Fonts that are intended to render all Unicode code points using variable-spacing glyphs that are non-marking (*Adobe Blank VF* and *Adobe Blank 2 VF*) or marking (*Adobe **Black** VF* and *Adobe **Black** 2 VF*).

These Variable Fonts are based on [*Adobe Blank*](https://github.com/adobe-fonts/adobe-blank) and [*Adobe Blank 2*](https://github.com/adobe-fonts/adobe-blank-2), which differ in that the former font includes 2,048 functional glyphs (GIDs 1 through 2048) to which all Unicode code points map, while the latter font maps all Unicode code points to a single functional glyph (GID+1). *Adobe Blank* uses [Format 4](https://docs.microsoft.com/en-us/typography/opentype/spec/cmap#format-4-segment-mapping-to-delta-values) (*Segment mapping to delta values*) and [Format 12](https://docs.microsoft.com/en-us/typography/opentype/spec/cmap#format-12-segmented-coverage) (*Segmented coverage*) 'cmap' subtables, and *Adobe Blank 2* uses a [Format 13](https://docs.microsoft.com/en-us/typography/opentype/spec/cmap#format-13-many-to-one-range-mappings) (*Many-to-one range mappings*) subtable.

These Variable Fonts map 1,111,998 Unicode code points to either ranges of 2,048 glyphs (GIDs 1 through 2048) or a single glyph (CID+1). The 2,048 High and Low Surrogates (U+D800 through U+DFFF), the two noncharacters in the BMP and in each of the 16 Supplementary Planes (FFFE and FFFF), and the 32 noncharacters in the range U+FDD0 through U+FDEF are explicitly and intentionally excluded. As fully-functional Variable Fonts, the following 'sfnt' tables are included: BASE, CFF2 (OpenType/CFF2-only), DSIG (stub; OpenType/CFF2-only), GSUB (stub), HVAR, OS/2, STAT, VORG (OpenType/CFF2-only), VVAR, cmap, fvar, glyf (TrueType-only), gvar (TrueType-only), head, hhea, hmtx, loca (TrueType-only), maxp, name, post, vhea, and vmtx.

These Variable Fonts include two axes, '[wdth](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxistag_wdth)' (*Width*) and 'HGHT' (*Height*). The default values for both axes is 0 (zero), meaning non-spacing in both writing directions. Both axes have a range of 0 through 1000, with a value of 1000 corresponding to a horizontal or vertical advance of 1000 units.

The following is a summary of the four Variable Fonts that are included in this project, which are provided in OpenType/CFF2 (OTF) and TrueType (TTF) forms, along with WOFF2 (WOFF2/OTF &amp; WOFF2/TTF) versions of both forms for good measure:

*AdobeBlankVF*: 2,049 glyphs; GIDs 1&ndash;2048 are non-marking; Format 4/12 'cmap' subtables  
*Adobe**Black**VF*: 2,049 glyphs; GIDs 1&ndash;2048 are marking; Format 4/12 'cmap' subtables  
*AdobeBlank2VF*: two glyphs; GID+1 is non-marking; Format 13 'cmap' subtable  
*Adobe**Black**2VF*: two glyphs; GID+1 is marking; Format 13 'cmap' subtable

Note that some environments cannot consume fonts with a Format 13 'cmap' subtable. Under such circumstances, please use *Adobe Blank VF* or *Adobe **Black** VF*.

## Building the font from source

### Requirements

To build the Variable Fonts from source, you need to have installed the [Adobe Font Development Kit for OpenType](https://github.com/adobe-type-tools/afdko/) (AFDKO) tools. The AFDKO tools are widely used for font development today, and are part of most font editor apps.

### Building the font

In this repository, all necessary files are in place for building the Variable Fonts, and the *build.sh* file can simply be executed.

## Getting Involved

Send suggestions for changes to the Adobe Blank VF & Friends project maintainer, [Dr. Ken Lunde](mailto:lunde@adobe.com?subject=[GitHub]%20Adobe%20Blank%20VF), for consideration.
