#Read all data
all_dat=fread("./household_power_consumption.txt",header =T,sep=";",na.strings ="?")

#Subset to dates of interest and remove the rest of the data
sub_dat = all_dat[ Date=="1/2/2007"| Date=="2/2/2007"]
rm(all_dat)

#Reformat date and create DateTime variable
sub_dat[,Date:=as.Date(strptime(Date,"%d/%m/%Y")),with=T]
sub_dat[,DateTime:=as.POSIXct(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")),with=T]

#Open device
png(file = "plot2.png")

#Plot cactive power
with(sub_dat,plot(DateTime,Global_active_power,type="l",
                  ylab="Global Active Power (kilowatts)",xlab=""))

#Close device
dev.off()











png(file = "plot2.png")
dev.off()


