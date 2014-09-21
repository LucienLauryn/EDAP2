library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

data = ddply(NEI, .(year, fips), summarise, Emission = sum(Emissions))

png(file = "plot2.png", bg = "white", width = 480, height = 480)
plot(c("1999","2002","2005","2008"),data$Emission[data$fips == 24510], type = "b", 
     main = "Total Emissions 1999-2008",
     xlab = "Year", ylab = "Total Emissions for Baltimore City, MD 1999-2008",
     xlim = c(1998,2008))
dev.off()




