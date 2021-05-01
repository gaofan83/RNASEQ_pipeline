# The input are the splice junction files from STAR will look like such:
# column 1:  chromosome
# column 2:  first base of the intron (1-based)
# column 3:  last base of the intron (1-based)
# column 4:  strand (0:  undefined, 1:  +, 2:  -)
# column 5:  intron  motif:  0:  non-canonical;  1:  GT/AG,  2:  CT/AC,  3:  GC/AG,  4:  CT/GC,  5:AT/AC, 6:  GT/AT
# column 6:  0:  unannotated, 1:  annotated (only if splice junctions database is used)
# column 7:  number of uniquely mapping reads crossing the junction
# column 8:  number of multi-mapping reads crossing the junction
# column 9:  maximum spliced alignment overhang
# starsj file looks like.....
# 0      1        2     3   4   5  6   7     8
# chr1    11672    12009    1    1    1    0    2    67
# chr1    12228    12612    1    1    1    0    1    31
# chr1    14830    14969    2    2    1    75    162    71
#############################################
# The output bed will look like such so that score is the number of unique mappers
# and the name is the original 1-based star junction and if it was annotated
#############################################
# chr1    11671    12008    chr1:11672-12009|1    0    +
# chr1    12227    12611    chr1:12228-12612|1    0    +
# chr1    14829    14968    chr1:14830-14969|1    75    -


awk '{if($4=="1") print $1"\t"$2-1"\t"$3-1"\t"$1":"$2"-"$3"|"$5"\t"$7"\t+"; else print $1"\t"$2-1"\t"$3-1"\t"$1":"$2"-"$3"|"$5"\t"$7"\t-";}' sample_SJ.out.tab > sample_SJ.bed
