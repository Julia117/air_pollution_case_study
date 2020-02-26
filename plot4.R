NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

comb <- unique(subset(SCC, grepl("Coal|Comb", Short.Name), c(SCC, Short.Name)))
all_coal <- subset(NEI, SCC %in% comb$SCC)
sum0 <- sum(subset(all_coal, year == 1999)$Emissions)
sum1 <- sum(subset(all_coal, year == 2008)$Emissions)

rng <- range(sum1, sum0)
png(file = "plot4.png", bg="white")

with(all_coal, plot(1999, sum0, xlim = c(1998, 2009), ylim = rng, pch = 20, xlab = "Year", 
                    ylab = "Total emission from coal, tons"))

with(all_coal, points(2008, sum1, xlim = c(1998, 2009), ylim = rng, pch = 20))
lines(c(1999, 2008),c(sum0, sum1))
dev.off()