## Download the dataset


hpc.url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
hpc.zip <- basename(hpc.url)
hpc.txt <- "household_power_consumption.txt"

if ( !(file.exists(hpc.txt) | file.exists(hpc.zip)) )
  download.file(hpc.url, destfile = hpc.zip, method = "curl")

if (!file.exists(hpc.txt))
  unzip(hpc.zip)

## Load the required part of the dataset

SKIP.NROWS <- 66637
READ.NROWS <- 2880
SEP.CHAR <- ";"
NA.CHAR <- "?"

hpc.names <- read.table(hpc.txt, nrows = 1, header = TRUE, sep = SEP.CHAR)

hpc <- read.table(
  hpc.txt,
  sep = SEP.CHAR,
  na.strings = NA.CHAR,
  skip = SKIP.NROWS,
  nrow = READ.NROWS,
  colClasses = c(rep("character", 2), rep("numeric", 7)))

colnames(hpc) <- colnames(hpc.names)

hpc <- transform(
  hpc,
  Date = as.Date(Date, format = "%d/%m/%Y"),
  Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))