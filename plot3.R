#household_power_consumption.txt is extracted from archive and placed in working directory

housingdata <- read.table("household_power_consumption.txt", header = TRUE,  dec = ".", sep = ";", na.strings="?", stringsAsFactors=FALSE) #import of the entire dataset
housingdatasubset <- housingdata[which(housingdata$Date %in% c("1/2/2007","2/2/2007")),] #subsetting 2 days

png("plot3.png") #open graphics device

  plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_1, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)") #constructing first graph (linear plot)
      lines(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_2, col = "red") #adding the second graph
      lines(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_3, col = "blue") #adding the third graph
      legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1) #constructing legend (colors assigned manually, probably there is a better solution)

dev.off() #saving png file to working directory (480x480 px by default)
