NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

mv <- unique(subset(SCC, grepl("Motor", Short.Name), c(SCC, Short.Name)))
all_motors <- subset(NEI, SCC %in% mv$SCC)
sum0_b <- sum(subset(all_coal, year == 1999 & fips == "24510")$Emissions)
sum1_b <- sum(subset(all_coal, year == 2008 & fips == "24510")$Emissions)

sum0_c <- sum(subset(all_coal, year == 1999 & fips == "06037")$Emissions)
sum1_c <- sum(subset(all_coal, year == 2008 & fips == "06037")$Emissions)


rng <- range(sum1_b, sum0_b, sum0_c, sum1_c)

png(file = "plot6.png", bg="white")


with(all_motors, plot(1999, sum0_b, xlim = c(1998, 2009), ylim = rng, pch = 20, xlab = "Year", 
                      ylab = "Total emission from coal, tons"), col = "red")
with(all_motors, points(2008, sum1_b, xlim = c(1998, 2009), ylim = rng, pch = 20))
lines(c(1999, 2008),c(sum0_b, sum1_b), col = "red")

with(all_motors, points(1999, sum0_c, xlim = c(1998, 2009), ylim = rng, pch = 20, xlab = "Year", 
                      ylab = "Total emission from coal, tons"), col = "blue")
with(all_motors, points(2008, sum1_c, xlim = c(1998, 2009), ylim = rng, pch = 20))
lines(c(1999, 2008),c(sum0_c, sum1_c), col = "blue")
legend(x="topright", legend=c("Baltimore", "California"), col=c("red","blue"), 
       lwd=1, lty=c(1,1,1), xjust=1, yjust=0, cex=1)

dev.off()