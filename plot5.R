library(ggplot2)
#�����ļ�
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#�ϲ���������
NEI_ALL <- merge(NEI, SCC, by="SCC")
#ɸѡ���Ͷ���Ħ��1999�굽2008��������ŷ�������
NEI_year <- subset(NEI,NEI$fips=="24510" & NEI$type=="ON-ROAD")
#ͳ�Ʋ�ͬ��ݼ������ŷ�������
final_data <- aggregate(Emissions ~ year,NEI_year,sum)
#����ͼƬ�����
png(filename="plot5.png",width=650)
pic <- ggplot(final_data, aes(year, Emissions)) +geom_point()+ geom_line() + xlab("���") + ylab(expression("PM"[2.5]*"�ŷ�����")) + ggtitle("1999-2008�����������ŷ���") + geom_text(label=ceiling(final_data$Emissions),x=final_data$year+0.2,y=final_data$Emissions+10)
print(pic)
dev.off()