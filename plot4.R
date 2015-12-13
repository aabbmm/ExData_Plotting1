#Read all data
all_dat=fread("./household_power_consumption.txt",header =T,sep=";",na.strings ="?")

#Subset to dates of interest and remove the rest of the data
sub_dat = all_dat[ Date=="1/2/2007"| Date=="2/2/2007"]
rm(all_dat)

#Reformat date and create DateTime variable
sub_dat[,Date:=as.Date(strptime(Date,"%d/%m/%Y")),with=T]
sub_dat[,DateTime:=as.POSIXct(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")),with=T]

#Open device
png(file = "plot4.png")
par(mfrow=c(2,2))

#Make plots
#Topleft
with(sub_dat,plot(DateTime,Global_active_power,type="l",
                  ylab="Global Active Power",xlab=""))

#topright
with(sub_dat,plot(DateTime,Voltage,type="l",xlab="datetime"))

#Bottomleft
with(sub_dat,plot(DateTime,Sub_metering_1,type="l",
                  ylab="Energy sub metering",xlab=""))
with(sub_dat,lines(DateTime,Sub_metering_2,col="red"))
with(sub_dat,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",  lty=1,col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")

#Bottomright
with(sub_dat,plot(DateTime,Global_reactive_power,type="l",
             xlab="datetime"))

#Close device
dev.off()











png(file = "plot2.png")
dev.off()


