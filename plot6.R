# Download the data and read it using "readRDS"
pmurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# I put asterisk on my destination file location for security purposes.
download.file(pmurl, destfile="C:\\Users\\***\\****\\last module\\pm2.5\\pm2.5.zip")
unzip(zipfile = "pm2.5.zip", exdir = "C:\\Users\\****\\****\\last module\\pm2.5file" )
pm2.5data  <-readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\summarySCC_PM25.rds")
pm2.5data2 <- readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\Source_Classification_Code.rds")

#Use the gglot2 package
# Comparison of the emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
subset2 <- pm2.5data[(pm2.5data$fips=="24510"|pm2.5data$fips=="06037") & pm2.5data$type=="ON-ROAD",  ]
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subset2, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, Maryland"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, California"

#Create a png file from the plot
png("plot6.png", width=1000, height=480)
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  + xlab("year") + ylab("Total PM (2.5) Emissions") + ggtitle('Total Emissions from motor vehicle (ON-ROAD) in Baltimore City, Maryland vs Los Angeles, California from 1999-2008')
print(g)
dev.off()
