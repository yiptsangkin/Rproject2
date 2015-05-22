#导入文件
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#分别获取1999年、2002年、2005年、2008年的排放总量
NEI_1999 <- subset(NEI,NEI$year==1999)
NEI_2002 <- subset(NEI,NEI$year==2002)
NEI_2005 <- subset(NEI,NEI$year==2005)
NEI_2008 <- subset(NEI,NEI$year==2008)
#用基础系统画出折线图
emissions_all <- c(sum(NEI_1999$Emissions),sum(NEI_2002$Emissions),sum(NEI_2005$Emissions),sum(NEI_2008$Emissions))
time <- c(1999,2002,2005,2008)
png(filename = "plot1.png")
plot(time,emissions_all,xlab="年份",ylab=expression(PM[2.5]*"排放总量"),pch=19,col="blue",type="b")
title(expression("美国"*PM[2.5]*"排放总量趋势"))
dev.off()