library(ggplot2)
#导入文件
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#合并整个数据
NEI_ALL <- merge(NEI, SCC, by="SCC")
#筛选出巴尔的摩从1999年到2008年机动车排放量数据
NEI_year <- subset(NEI,(NEI$fips=="24510"|NEI$fips=="06037")&NEI$type=="ON-ROAD")
#统计不同年份激动车排放量数据
final_data <- aggregate(Emissions ~ year+fips,NEI_year,sum)
final_data$fips[final_data$fips=="24510"]<- "巴尔的摩"
final_data$fips[final_data$fips=="06037"]<- "洛杉矶"
#绘制图片并输出
png(filename="plot6.png", width=1040, height=480)
pic <- ggplot(final_data, aes(factor(year), Emissions,fill=year)) + facet_grid(. ~ fips) + geom_bar(stat="identity") + xlab("年份") + ylab(expression("PM"[2.5]*"排放总量")) + ggtitle("巴尔的摩市与洛杉矶市1999-2008排放量对比") + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))
print(pic)
dev.off()