NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
pm0 <- subset(NEI, year == 1999)
pm1 <- subset(NEI, year == 2002)
pm2 <- subset(NEI, year == 2005)
pm3 <- subset(NEI, year == 2008)

sum0 <- sum(pm0$Emissions)
sum1 <- sum(pm1$Emissions)
sum2 <- sum(pm2$Emissions)
sum3 <- sum(pm3$Emissions)

rng <- range(sum3, sum0)

png(file = "plot1.png", bg="white")

with(pm0, plot(1999, sum0, xlim = c(1998, 2009), ylim = rng, pch = 20, xlab = "Year", 
               ylab = "Total emissions, tons"))
with(pm1, points(2002, sum1, xlim = c(1998, 2009), ylim = rng, pch = 20))
with(pm1, points(2005, sum2, xlim = c(1998, 2009), ylim = rng, pch = 20))
with(pm1, points(2008, sum3, xlim = c(1998, 2009), ylim = rng, pch = 20))
lines(c(1999, 2002, 2005, 2008),c(sum0, sum1, sum2, sum3))
dev.off()
