# Download the data and read it using "readRDS"
pmurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# I put asterisk on my destination file location for security purposes.
download.file(pmurl, destfile="C:\\Users\\***\\****\\last module\\pm2.5\\pm2.5.zip")
unzip(zipfile = "pm2.5.zip", exdir = "C:\\Users\\****\\****\\last module\\pm2.5file" )
pm2.5data  <-readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\summarySCC_PM25.rds")
pm2.5data2 <- readRDS("C:\\Users\\***\\***\\last module\\pm2.5file\\Source_Classification_Code.rds")

#Generate a plot for the total emissions of PM (2.5) from the years of observation
aggregatetotal <- aggregate(Emissions ~ year, pm2.5data, sum)

png('plot1.png', width=480, height=480)

barplot(height=aggregatetotal$Emissions, names.arg=aggregatetotal$year, xlab="Years", ylab= "Total PM(2.5) Emission" , main = "Total PM(2.5) Emission per Year of Observation", col="violet")

dev.off()


