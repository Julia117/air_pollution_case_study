NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
bltmr <- subset(NEI, fips == "24510")

sum0 <- sum(subset(bltmr, year == 1999)$Emissions)
sum3 <- sum(subset(bltmr, year == 2008)$Emissions)
rng <- range(sum3, sum0)

png(file = "plot2.png", bg="white")

with(bltmr, plot(1999, sum0, xlim = c(1998, 2009), ylim = rng, pch = 20, xlab = "Year", 
               ylab = "Total emission in Baltimore, tons"))

with(bltmr, points(2008, sum3, xlim = c(1998, 2009), ylim = rng, pch = 20))
lines(c(1999, 2008),c(sum0, sum3))
dev.off()
