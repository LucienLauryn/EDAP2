library(ggplot2)
library(plyr)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

data = ddply(NEI, .(year), summarise, Emission = sum(Emissions))

png(file = "plot1.png", bg = "white", width = 480, height = 480)
plot(c("1999","2002","2005","2008"),data$Emission, type = "b", 
     main = "Total Emissions 1999-2008",
     xlab = "Year", ylab = "Total Emissions",
     xlim = c(1998,2008))
dev.off()



