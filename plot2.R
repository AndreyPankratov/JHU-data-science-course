#household_power_consumption.txt is extracted from archive and placed in working directory

housingdata <- read.table("household_power_consumption.txt", header = TRUE,  dec = ".", sep = ";", na.strings="?", stringsAsFactors=FALSE) #import of the entire dataset
housingdatasubset <- housingdata[which(housingdata$Date %in% c("1/2/2007","2/2/2007")),] #subsetting 2 days

png("plot2.png") #open graphics device

  plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)") #constructing graph (linear plot)

dev.off() #saving png file to working directory (480x480 px by default)
