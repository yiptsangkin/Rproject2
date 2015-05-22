#导入文件
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
#筛选出巴尔的摩市的数据
NEI_BDM <- subset(NEI,NEI$fips =="24510")
#分别获取1999年到2008年的排放总量
NEI_year <- tapply(X = NEI_BDM$Emissions, INDEX = NEI_BDM$year, FUN = sum)
#用基础系统画出折线图
png(filename = "plot1.png")
plot(NEI_year,xlab="年份",ylab=expression(PM[2.5]*"排放总量"),pch=19,col="blue",type="b")
title(expression("美国巴尔的摩市近年"*PM[2.5]*"排放总量趋势"))
dev.off()