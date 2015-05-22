library(ggplot2)
#导入文件
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#合并整个数据
NEI_ALL <- merge(NEI, SCC, by="SCC")
#筛选出巴尔的摩从1999年到2008年机动车排放量数据
NEI_year <- subset(NEI,NEI$fips=="24510" & NEI$type=="ON-ROAD")
#统计不同年份激动车排放量数据
final_data <- aggregate(Emissions ~ year,NEI_year,sum)
#绘制图片并输出
png(filename="plot5.png",width=650)
pic <- ggplot(final_data, aes(year, Emissions)) +geom_point()+ geom_line() + xlab("年份") + ylab(expression("PM"[2.5]*"排放总量")) + ggtitle("1999-2008机动车的总排放量") + geom_text(label=ceiling(final_data$Emissions),x=final_data$year+0.2,y=final_data$Emissions+10)
print(pic)
dev.off()