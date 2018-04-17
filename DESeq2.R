library('DESeq2')
directory<-'./ft_seq/'
#use grep to search for the 'treated' part of filename to collect files
Files<-grep("*",list.files(directory),value=TRUE)

Veh_Chron_D2<-Files[1:6]
Cloz_Chron_D2<-Files[7:12]

sampleCondition1<-c('untreated','untreated','untreated','untreated','untreated','untreated','treated','treated','treated','treated','treated','treated')

deg1<-c(Veh_Chron_D2,Cloz_Chron_D2)
sampleTable<-data.frame(sampleName=deg1, fileName=deg1, condition=sampleCondition1)
ddsHTSeq<-DESeqDataSetFromHTSeqCount(sampleTable=sampleTable, directory=directory, design=~condition)
colData(ddsHTSeq)$condition<-factor(colData(ddsHTSeq)$condition, levels=c('untreated','treated'))
dds<-DESeq(ddsHTSeq)
res<-results(dds)
write.table(res,file="DEG_Veh_Chron_D2_Cloz_Chron_D2_DESEQ2.txt",quote=FALSE,sep="\t")
resOrdered<-res[order(res$padj),]
res_sig = subset(resOrdered, padj<0.05)
write.table(res_sig,file="DEG_Veh_Chron_D2_Cloz_Chron_D2_DESEQ2_SIG.txt",quote=FALSE,sep="\t")

