timedata=read.csv(file.choose())
str(timedata)
summary(timedata)
colSums(is.na(timedata))

names(timedata)[c(1:2)]=c("Date","Sales")

timedata=ts(timedata[,2],start=c(2003,1),frequency=12)
start(timedata)
end(timedata)
frequency(timedata)
StructTS(timedata)
timedata

class(timedata)
str(timedata)

plot(timedata,ylab='Sales',xlab='Year',main="Sales between 2003-2014",col="grey")

abline(reg=lm(timedata~time(timedata)))

cycle(timedata)
plot(aggregate(timedata,FUN=mean))

plot(log10(timedata),ylab="log(Sales)",xlab="Year",main="log(Sales) between 2003-2014",col="grey")
##Differencing the data to remove trend
plot(diff(timedata,differences = 1),ylab="Diff(Sales)",xlab="Year",main="Diff(Sales) between 2003-2014",col="grey")
#The differenced data continues to have unequal variance 

plot(diff(log10(timedata),differences = 1),ylab="Diff(Sales)",xlab="Year",main="Diff(Log(Sales)) between 2003-2014",col="grey")

LDTSdata=diff(log10(timedata),differences = 1)
require(forecast)
adf.test(LDTSdata,alternative="stationary")
adf.test(timedata,alternative="stationary")


kpss.test(LDTSdata)

par(mfrow=c(1,2))
acf(diff(log10(timedata)),main="ACF plot")#ACF PLOT -- Moving Average or q
pacf(diff(log10(timedata)),main="PACF plot")#PACF PLOT -- Auto Regressive or p

#Running the ARIMA model
ARIMAFit=arima((log10(timedata)),c(1,1,0))
summary(ARIMAFit)

require(forecast)
ARIMAFit1=auto.arima(log10(timedata),approximation=TRUE,trace=TRUE)

summary(ARIMAFit1)

ARIMAFit1$residuals

pred=predict(ARIMAFit1, n.ahead=36)
pred

par(mfrow=c(1,1))
plot(timedata,type='l',xlim=c(2004,2018),ylim=c(1,1600),xlab='Year',ylab='Sales')
lines(10^(pred$pred),col='red')

plot(timedata,type='l',xlim=c(2004,2018),ylim=c(1,1600),xlab='Year',ylab='Sales')
lines(10^(pred$pred),col='red')
lines(10^(pred$pred+2*pred$se),col="blue")
lines(10^(pred$pred-2*pred$se),col="black")

pred1=10^(pred$pred)
pred1
write.csv(pred1,"predict.csv",row.names=FALSE)

