#�����ļ�
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#�ֱ��ȡ1999�ꡢ2002�ꡢ2005�ꡢ2008����ŷ�����
NEI_1999 <- subset(NEI,NEI$year==1999)
NEI_2002 <- subset(NEI,NEI$year==2002)
NEI_2005 <- subset(NEI,NEI$year==2005)
NEI_2008 <- subset(NEI,NEI$year==2008)
#�û���ϵͳ��������ͼ
emissions_all <- c(sum(NEI_1999$Emissions),sum(NEI_2002$Emissions),sum(NEI_2005$Emissions),sum(NEI_2008$Emissions))
time <- c(1999,2002,2005,2008)
png(filename = "plot1.png")
plot(time,emissions_all,xlab="���",ylab=expression(PM[2.5]*"�ŷ�����"),pch=19,col="blue",type="b")
title(expression("����"*PM[2.5]*"�ŷ���������"))
dev.off()