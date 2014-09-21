library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

data = ddply(NEI, .(year, fips, type), summarise, Emissions = sum(Emissions))
x = data[data$fips == 24510,]

png(file = "plot3.png")
ggplot(data = x, aes(year,Emissions, color = type))+geom_line()+ggtitle("Baltimore City 1999-2008 Emissions summary")
dev.off()


