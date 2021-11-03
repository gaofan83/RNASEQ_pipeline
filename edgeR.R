# DEG analysis w/o replicate. Estimate bcv first
library(edgeR)

S1 = read.table("ft_seq/ftcounts_SRR8786531.txt", header=F, row.names=1)
S2 = read.table("ft_seq/ftcounts_SRR8786533.txt", header=F, row.names=1)
S3 = read.table("ft_seq/ftcounts_SRR8786535.txt", header=F, row.names=1)
data1<-cbind(S1, S2)
bcv<-estimateGLMCommonDisp(data1, design=NULL, method="deviance",robust="TRUE",subset=NULL)
y1 <- DGEList(counts=data1, group=1:2)
et1 <- exactTest(y1, dispersion=bcv^2)

data2<-cbind(S1, S3)
bcv<-estimateGLMCommonDisp(data2, design=NULL, method="deviance",robust="TRUE",subset=NULL)
y2 <- DGEList(counts=data2, group=1:2)
et2 <- exactTest(y2, dispersion=bcv^2)

data3<-cbind(S2, S3)
bcv<-estimateGLMCommonDisp(data3, design=NULL, method="deviance",robust="TRUE",subset=NULL)
y3 <- DGEList(counts=data3, group=1:2)
et3 <- exactTest(y3, dispersion=bcv^2)

write.table(et1$table, file="DEG_WT-G1_WT-G2.txt", quote=F, sep="\t")
write.table(et2$table, file="DEG_WT-G1_WT-S.txt", quote=F, sep="\t")
write.table(et3$table, file="DEG_WT-G2_WT-S.txt", quote=F, sep="\t")
