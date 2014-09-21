library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")


SCCcodes = SCC$SCC[grep("Mobile",SCC$EI.Sector)]

x = subset(NEI, SCC %in% SCCcodes)
x = ddply(x,.(year, fips),summarise,Emissions = sum(Emissions))
x = x[x$fips == "24510",]

png(file = "plot5.png", bg = "white")
ggplot(x,aes(year,Emissions))+geom_line()+ggtitle("Baltimore City 1999-2008 Motor vehicle Emissions summary")
dev.off()
