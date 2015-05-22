library(ggplot2)
#�����ļ�
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
#ɸѡ���Ͷ���Ħ�е�����
NEI_BDM <- subset(NEI,NEI$fips =="24510")
#ͳ�Ƹ���ݸ���type����PM2.5�ŷ���
NEI_AGG <- aggregate(Emissions ~ year + type, NEI_BDM, sum)
#��ӡ��ͼƬ
png(filename="plot3.png")
pic<-ggplot(NEI_AGG, aes(year, Emissions, color = type)) + geom_line() + xlab("���") + ylab(expression("PM"[2.5]*"�ŷ�����")) + ggtitle(expression("�����Ͷ���Ħ�н��겻ͬtype PM"[2.5]*"�ŷ���������"))
print(pic)
dev.off()