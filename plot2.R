#�����ļ�
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
#ɸѡ���Ͷ���Ħ�е�����
NEI_BDM <- subset(NEI,NEI$fips =="24510")
#�ֱ��ȡ1999�굽2008����ŷ�����
NEI_year <- tapply(X = NEI_BDM$Emissions, INDEX = NEI_BDM$year, FUN = sum)
#�û���ϵͳ��������ͼ
png(filename = "plot1.png")
plot(NEI_year,xlab="���",ylab=expression(PM[2.5]*"�ŷ�����"),pch=19,col="blue",type="b")
title(expression("�����Ͷ���Ħ�н���"*PM[2.5]*"�ŷ���������"))
dev.off()