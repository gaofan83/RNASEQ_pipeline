library(tximportData)
library(tximport)
library(readr)
library(DESeq2)

directory<-'./rsem/'
files<-grep("*genes.results",list.files(directory),value=TRUE)

OE<-files[c(3:10)]
MO<-files[c(11:20)]

df1<-data.frame(sampleID =factor(rep(1:4, each=2)),
                condition=factor(rep(c("Left", "right"),4)))

sampleTable<-data.frame(sampleName=OE, fileName=OE, df1)

#import files
txi <- tximport(paste(directory, OE, sep=""), type = "rsem", txIn = FALSE, txOut = FALSE)
names(txi)

# cond is a vector with conditions to be used for differential analysis
#cond <- rep(c("Left", "right"),4)
#sampleTable <- data.frame(condition = factor(cond))
#rownames(sampleTable) <- colnames(txi$counts)

txi$length[txi$length <= 0] <- 1

ddsRSEM <- DESeqDataSetFromTximport(txi, sampleTable, ~ sampleID + condition)

#colData(dds)<-DataFrame(df1)
dds<-DESeq(ddsRSEM)

res<-results(dds)
#write.table(res,file="DEG_OE_DESEQ2.txt",quote=FALSE,sep="\t")
resOrdered<-res[order(res$padj),]
res_sig = subset(resOrdered, padj<0.1)
#write.table(res_sig,file="DEG_OE_DESEQ2_SIG.txt",quote=FALSE,sep="\t")

