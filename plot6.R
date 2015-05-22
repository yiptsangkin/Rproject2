library(ggplot2)
#�����ļ�
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#�ϲ���������
NEI_ALL <- merge(NEI, SCC, by="SCC")
#ɸѡ���Ͷ���Ħ��1999�굽2008��������ŷ�������
NEI_year <- subset(NEI,(NEI$fips=="24510"|NEI$fips=="06037")&NEI$type=="ON-ROAD")
#ͳ�Ʋ�ͬ��ݼ������ŷ�������
final_data <- aggregate(Emissions ~ year+fips,NEI_year,sum)
final_data$fips[final_data$fips=="24510"]<- "�Ͷ���Ħ"
final_data$fips[final_data$fips=="06037"]<- "��ɼ��"
#����ͼƬ�����
png(filename="plot6.png", width=1040, height=480)
pic <- ggplot(final_data, aes(factor(year), Emissions,fill=year)) + facet_grid(. ~ fips) + geom_bar(stat="identity") + xlab("���") + ylab(expression("PM"[2.5]*"�ŷ�����")) + ggtitle("�Ͷ���Ħ������ɼ����1999-2008�ŷ����Ա�") + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))
print(pic)
dev.off()