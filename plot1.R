
#Read all data
all_dat=fread("./household_power_consumption.txt",header =T,sep=";",na.strings ="?")

#Subset to dates of interest and remove the rest of the data
sub_dat = all_dat[ Date=="1/2/2007"| Date=="2/2/2007"]
rm(all_dat)

#Open device
png(file = "plot1.png")

#Plot histogram
hist(sub_dat$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")

#Close device
dev.off()


