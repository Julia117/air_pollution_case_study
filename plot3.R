NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
bltmr <- subset(NEI, fips == "24510")
grouped <- group_by(bltmr, type, year)
total_emiss <- aggregate(grouped$Emissions, by= list(grouped$type, grouped$year), FUN=sum)
names(total_emiss) <- c("Type", "Year", "Emission")
png(file = "plot3.png", bg="white")

ggplot(total_emiss, aes(Year,Emission,group=Type,col=Type)) + geom_line()
dev.off()
