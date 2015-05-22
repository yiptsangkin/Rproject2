# Rproject2
Rproject2
简介

细颗粒物(PM2.5)为大气环境污染物，有充分的证据表明该物质对人类健康有害。在美国，环境保护署(EPA)负责制定针对细颗粒物的国家环境空气质量标准，并且跟踪大气中该污染物的排放量。大约每3年，EPA会发布关于PM2.5排放量的数据库。该数据库被称为国家排放清单(National Emissions Inventory, NEI)。有关NEI的更多信息，请访问EPA国家排放清单网站。

对于每个年份，NEI均会记录整整一年中每种PM源各排放了多少吨PM2.5。在本作业中，你将使用1999年、2002年、2005年和2008年的数据。

数据

对于本作业的数据，你可以从课程网站以单个zip文件的形式获取：

互评作业数据 [29Mb]
zip文件包含以下两个文件：

PM2.5排放量数据(summarySCC_PM25.rds)：该文件包含一个数据帧，该数据帧含有1999年、2002年、2005年和2008年所有PM2.5排放量数据。对于每个年份，表格中包含整整一年中某特定类型来源的PM2.5排放吨数。以下是前面的几行。

##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
## 24 09001 10200602  PM25-PRI     1.490 POINT 1999
fips: 一个五位数（表示为字符串），代表美国的县

SCC: 以数字串表示的来源名称（请参见来源代码分类表）

Pollutant: 代表污染物的字符串

Emissions: PM2.5排放量，以吨为单位

type: 来源类型（point、non-point、on-road或non-road）

year: 排放量记录所属的年份

来源分类代码表(Source_Classification_Code.rds)：该表格指明了排放量表中SCC数字串与PM2.5源实际名称之间的映射关系。来源从一般到具体按几种不同的方式划分，你可以选择浏览自己认为最有用的类别。例如，来源“10100101”代表“外部燃烧物/电气/无烟煤/粉煤”。

你可以使用R中的readRDS()函数来读取这两个文件。例如，你可以使用以下代码来读取每个文件：

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
只要这些文件均位于你目前的工作目录即可（调用dir()检查一下，看看这些文件是否在列表中）。

作业

本作业的整体目标是浏览国家排放清单数据库，了解从1999年到2008年这10年期间美国细颗粒物污染情况。你可以使用任何所需的R包来支持你的分析。

问题

在你的探索性分析中，你必须完成以下问题和任务。对于每个问题/任务，你需要各绘制一个图形。除非另有规定，否则你可以使用R中的任何绘图系统进行绘图。

从1999年到2008年，美国的PM2.5总排放量是否呈递减趋势？ 使用基础绘图系统绘制一个图形，显示1999年、2002年、2005年和2008年各年间所有来源的PM2.5总排放量。

从1999年到2008年，马里兰州巴尔的摩市（fips ==“24510”）的PM2.5排放量是否呈递减趋势？使用基础绘图系统，绘制用于解答该问题的图形。

在“type”（point、nonpoint、onroad、nonroad）变量指定的四种来源中，哪种来源见证了巴尔的摩市从1999年到2008年的排放量呈递减趋势？ 哪种来源见证了从1999年到2008年的排放量呈递增趋势？ 使用ggplot2绘图系统，绘制用于解答该问题的图形。

在整个美国，从1999年到2008年煤燃烧排放量的变化情况如何？

在巴尔的摩市，从1999年到2008年机动车排放量的变化情况如何？

对比巴尔的摩市的机动车排放量与加利福尼亚州洛杉矶县（fips ==“06037”）的机动车排放量。哪个城市在机动车排放量方面的变化更大？

绘图并提交图形

对于每个图形，你均应

构建图形并将其保存到PNG文件。
创建用于构建相应图形的独立R代码文件（plot1.R、plot2.R等），即，plot1.R中的代码用于构建plot1.png图形。你的代码文件应该包括用于读取数据的代码，这样图形才会被完全重现。你还应该包括用于创建PNG文件的代码。仅包括单个图形的代码（例如，plot1.R应该仅包含用于生成plot1.png的代码）
在作业提交页面上传PNG文件
从相应的R文件中复制R代码，并将其粘贴到互评作业对应的文本框中。


* English Version *


Assignment

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

Questions

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

Making and Submitting Plots

For each plot you should

Construct the plot and save it to a PNG file.

Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)

Upload the PNG file on the Assignment submission page

Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.
