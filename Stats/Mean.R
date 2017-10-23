#Mean

set.seed(1234)
(x = ceiling(rnorm(100,50,10)))
meanx=sum(x)/length(x)
meanx
mean(x)
summary(x)

#trimming values ----
x
set.seed(1234)
(x=ceiling(runif(100,50,100)))
mean(x)
mean(x,trim=.1)

#NA values ----
x[c(1,20,30)] = NA
x
length(na.omit(x)) #3 values
mean(x) #error
mean(x,na.rm=T)

#Mean Deviation
x = c(3,6,6,7,8,11,15,16)
(mx=mean(x))
(mdev=x-mx)
abs(mdev)
(mabsdev=sum(abs(mdev))/length(x))
mad(x)
mad(x,center=mean(x))

x=c(2,3,4,4,5,5)
library(modeest)
m = mlv(x, method="mfv")
m

getmode(x)
