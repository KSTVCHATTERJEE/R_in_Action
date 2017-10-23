set.seed(1234)
x = ceiling(rnorm(100,50,10))
x
#Quartiles
quantile(x,c(0.25,0.5,0.75))
quantile(x)
IQR(x)
quantile(x,seq(.1,1,by=0.1))
quantile(x,seq(0.01,1,by=0.01))

library(timeSeries)
mtcars
colQuantiles(mtcars)
colSkewness(mtcars)
colKurtosis(mtcars)

