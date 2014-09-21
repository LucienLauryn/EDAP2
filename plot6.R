library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

SCCcodes = SCC$SCC[grep("Mobile",SCC$EI.Sector)]

x = subset(NEI, SCC %in% SCCcodes)
x = ddply(x,.(year, fips),summarise,Emissions = sum(Emissions))
z = x[x$fips == "24510",]
y = x[x$fips == "06037",]
w = rbind(z,y)
w$fips = ifelse(w$fips == "24510","Baltimore City","Los Angeles County")

png(file = "plot6.png", bg = "white")
ggplot(w,aes(year,Emissions, color = fips))+geom_line(size = 1)+ggtitle("1999-2008 Motor Emissions summary")
dev.off()