# Download the data and read it using "readRDS"
pmurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# I put asterisk on my destination file location for security purposes.
download.file(pmurl, destfile="C:\\Users\\***\\****\\last module\\pm2.5\\pm2.5.zip")
unzip(zipfile = "pm2.5.zip", exdir = "C:\\Users\\****\\****\\last module\\pm2.5file" )
pm2.5data  <-readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\summarySCC_PM25.rds")
pm2.5data2 <- readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\Source_Classification_Code.rds")

#Use the gglot2 package
library(ggplot2)
subset <- pm2.5data[pm2.5data$fips=="24510" & pm2.5data$type=="ON-ROAD",  ]
aggregatedTotalByYr <- aggregate(Emissions ~ year, subset, sum)

png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYr, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") +  ylab(expression("Total PM(2.5) Emissions")) + ggtitle('Total Emissions from motor vehicle (ON-ROAD) in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()
