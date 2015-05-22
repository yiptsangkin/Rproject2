library(ggplot2)
#导入文件
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
#筛选出巴尔的摩市的数据
NEI_BDM <- subset(NEI,NEI$fips =="24510")
#统计各年份各种type的总PM2.5排放量
NEI_AGG <- aggregate(Emissions ~ year + type, NEI_BDM, sum)
#打印出图片
png(filename="plot3.png")
pic<-ggplot(NEI_AGG, aes(year, Emissions, color = type)) + geom_line() + xlab("年份") + ylab(expression("PM"[2.5]*"排放总量")) + ggtitle(expression("美国巴尔的摩市近年不同type PM"[2.5]*"排放总量趋势"))
print(pic)
dev.off()