library(ggplot2)
#导入文件
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#合并整个数据
NEI_ALL <- merge(NEI, SCC, by="SCC")
#正则匹配含有coal（即煤炭）的数据
find_coal <- grepl("coal", NEI_ALL$Short.Name, ignore.case=TRUE)
#筛选出煤炭数据
outdata <- subset(NEI_ALL,find_coal)
#统计煤炭各年份的PM2.5总排量
final_data <- aggregate(Emissions ~ year, outdata, sum)
#输出图片
png(filename="plot4b.png",width=650)
pic <- ggplot(final_data, aes(year, Emissions)) +geom_point()+ geom_line() + xlab("年份") + ylab(expression("PM"[2.5]*"排放总量")) + ggtitle("煤炭来源的总排放量") + geom_text(label=ceiling(final_data$Emissions),x=final_data$year,y=final_data$Emissions+8500)
print(pic)
dev.off()