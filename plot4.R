library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")


SCCcodes = SCC$SCC[grep("[cC]oal", SCC$EI.Sector)]

x = subset(NEI, SCC %in% SCCcodes)
x = ddply(x,.(year),summarise,Emissions = sum(Emissions))

png(file = "plot4.png", bg = "white")
ggplot(x,aes(year,Emissions))+geom_line()+ggtitle("1999-2008 Coal Emissions summary")
dev.off()