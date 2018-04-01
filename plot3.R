# Download the data and read it using "readRDS"
pmurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# I put asterisk on my destination file location for security purposes.
download.file(pmurl, destfile="C:\\Users\\***\\****\\last module\\pm2.5\\pm2.5.zip")
unzip(zipfile = "pm2.5.zip", exdir = "C:\\Users\\****\\****\\last module\\pm2.5file" )
pm2.5data  <-readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\summarySCC_PM25.rds")
pm2.5data2 <- readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\Source_Classification_Code.rds")

# Of the four types of sources indicated by the type variable, which of the four sources have seen decreases in emissions from 1999 2008 for Baltimore City?
# Using the ggplot2 package to generate plot and png file

library(ggplot2)

subsetpm2.5  <- pm2.5data[pm2.5data$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetpm2.5, sum)

png("plot3.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))

g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')

print(g)

dev.off()
