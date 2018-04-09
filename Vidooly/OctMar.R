octmar=read.csv('F:/R_in_Action/Vidooly/octmar3.csv',stringsAsFactors = FALSE)
str(octmar)
octmar$date=as.Date(octmar$date,format="%d-%m-%Y")
octmar$date
omn=as.data.frame(octmar[,c(5,2)])
colSums(is.na(octmar))
nrow(omn)
library(xts)
library(zoo)
channel1 <- xts(omn[,2], order.by=as.Date(omn[,1], "%Y-%m-%d"))
channel1
start(channel1)
end(channel1)
str(channel1)

plot(channel1,ylab='Views',xlab='Date',main="Views between Oct 2016 - Mar 2017",col="grey")
plot(diff(channel1),ylab='Views',xlab='Date',main="Views between Oct 2016 - Mar 2017",col="grey")

abline(reg=lm(channel~time(channel1)))

cycle(channel1)
plot(aggregate(channel1,FUN=mean))

library(tseries)
adf.test(channel1,alternative="stationary")

ch2=diff(channel1)
par(mfrow=c(1,2))
ch2 = as.data.frame(ch2)
ch2$V1[is.na(ch2$V1)]=0
ch2=as.xts(ch2)
class(ch2)
channel1
ch2

acf(ch2,main="ACF plot")#ACF PLOT -- Moving Average or q
pacf(ch2,main="PACF plot")#PACF PLOT -- Auto Regressive or p

ARIMAFit=arima(channel1,c(0,1,1))
summary(ARIMAFit)

require(forecast)
ARIMAFit1=auto.arima(channel1,approximation=TRUE,trace=TRUE)

summary(ARIMAFit1)

rmse(ARIMAFit$residuals)
ARIMAFit1$residuals

pred=predict(ARIMAFit, n.ahead=91)
str(pred)
pred2 = pred$pred+2*pred$se
pred2=round(pred2,0)
pred2
write.csv(pred2,"F:/R_in_Action/Vidooly/octmar4.csv")

omn2=as.data.frame(octmar[,c(5,3)])
omn2

colSums(is.na(octmar))
nrow(omn2)
library(xts)
library(zoo)
channel2 <- xts(omn2[,2], order.by=as.Date(omn2[,1], "%Y-%m-%d"))
channel2
start(channel2)
end(channel2)
str(channel2)

plot(channel2,ylab='Subscribers',xlab='Date',main="Views between Oct 2016 - Mar 2017",col="grey")
plot(diff(channel2,differences = 1),ylab='Views',xlab='Date',main="Views between Oct 2016 - Mar 2017",col="grey")


cycle(channel2)

library(tseries)
adf.test(diff(channel2),alternative="stationary")

channel2
ch3=diff(channel2)
ch3
ch3 = as.data.frame(ch3)
ch3$V1[is.na(ch3$V1)]=0
ch3=as.xts(ch3)
class(ch3)
channel2
ch3

acf(ch3,main="ACF plot")#ACF PLOT -- Moving Average or q
pacf(ch3,main="PACF plot")#PACF PLOT -- Auto Regressive or p

ARIMAFit2=arima(channel2,c(0,1,1))
summary(ARIMAFit2)

pred3=predict(ARIMAFit2, n.ahead=91)
str(pred3)
pred4 = pred3$pred+2*pred3$se
pred5=round(pred4,0)
pred5
write.csv(pred5,"F:/R_in_Action/Vidooly/octmar5.csv")

omn3=as.data.frame(octmar[,c(5,4)])
omn3
nrow(omn3)
library(xts)
library(zoo)
channel3 <- xts(omn3[,2], order.by=as.Date(omn3[,1], "%Y-%m-%d"))
channel3
start(channel3)
end(channel3)
str(channel3)

plot(channel3,ylab='Videocount',xlab='Date',main="Videocount between Oct 2016 - Mar 2017",col="grey")
plot(diff((channel3),differences = 1),col="grey")


cycle(channel3)

library(tseries)
adf.test(ch4,alternative="stationary")

channel3
ch4=diff(channel3)
ch4
ch4 = as.data.frame(ch4)
ch4$V1[is.na(ch4$V1)]=0
ch4=as.xts(ch4)
class(ch4)
channel3
ch4


acf(ch4,main="ACF plot")#ACF PLOT -- Moving Average or q
pacf(ch4,main="PACF plot")#PACF PLOT -- Auto Regressive or p

ARIMAFit3=arima((channel3),c(0,1,1))
summary(ARIMAFit3)

pred4=predict(ARIMAFit3, n.ahead=91)
str(pred4)
pred5 = (pred4$pred+2*pred4$se)
pred6=round(pred5,0)
pred6

plot(pred6)
write.csv(pred6,"F:/R_in_Action/Vidooly/octmar5.csv")
