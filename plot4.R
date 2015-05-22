library(ggplot2)
#�����ļ�
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#�ϲ���������
NEI_ALL <- merge(NEI, SCC, by="SCC")
#����ƥ�京��coal����ú̿��������
find_coal <- grepl("coal", NEI_ALL$Short.Name, ignore.case=TRUE)
#ɸѡ��ú̿����
outdata <- subset(NEI_ALL,find_coal)
#ͳ��ú̿����ݵ�PM2.5������
final_data <- aggregate(Emissions ~ year, outdata, sum)
#���ͼƬ
png(filename="plot4.png")
g <- ggplot(final_data, aes(year, Emissions)) +geom_point()+ geom_line() + xlab("���") + ylab(expression("PM"[2.5]*"�ŷ�����")) + ggtitle("ú̿��Դ�����ŷ���") + geom_text(label=final_data$year,x=final_data$year,y=final_data$Emissions+8500)
print(g)
dev.off()