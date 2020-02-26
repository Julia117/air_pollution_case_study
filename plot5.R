NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

mv <- unique(subset(SCC, grepl("Motor", Short.Name), c(SCC, Short.Name)))
all_motors <- subset(NEI, SCC %in% mv$SCC)
sum0 <- sum(subset(all_coal, year == 1999 & fips == "24510")$Emissions)
sum1 <- sum(subset(all_coal, year == 2008 & fips == "24510")$Emissions)

rng <- range(sum1, sum0)

png(file = "plot5.png", bg="white")


with(all_motors, plot(1999, sum0, xlim = c(1998, 2009), ylim = rng, pch = 20, xlab = "Year", 
                    ylab = "Total emission from coal in Baltimore, tons"))

with(all_motors, points(2008, sum1, xlim = c(1998, 2009), ylim = rng, pch = 20))
lines(c(1999, 2008),c(sum0, sum1))

dev.off()