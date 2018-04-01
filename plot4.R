# Download the data and read it using "readRDS"
pmurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# I put asterisk on my destination file location for security purposes.
download.file(pmurl, destfile="C:\\Users\\***\\****\\last module\\pm2.5\\pm2.5.zip")
unzip(zipfile = "pm2.5.zip", exdir = "C:\\Users\\****\\****\\last module\\pm2.5file" )
pm2.5data  <-readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\summarySCC_PM25.rds")
pm2.5data2 <- readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\Source_Classification_Code.rds")


# Using the ggplot2 package to generate plot and png file

merge1 <- merge(pm2.5data,pm2.5data2)
library(ggplot2)
# Using the US data, how have emissions from coal combustion-related sources changed from 1999-2008?

coalMatches  <- grepl("coal", merge1$Short.Name, ignore.case=TRUE)
subsetmerge1 <- merge1[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetmerge1, sum)

png("plot4.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))

g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008')

print(g)

dev.off()

