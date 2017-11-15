str(mtcars)
vars=c('mpg','hp','wt')
vars
head(mtcars[vars])
str(mtcars)
dim(mtcars)

summary(mtcars)
summary(mtcars[vars])
#sapply(x,FUN,options)
sapply(mtcars[vars],mean)
sapply(mtcars,fivenum)

library(Hmisc)
describe(mtcars[vars])

alpha=0.05
conflevel=00.95
alpha2=alpha/2
qt(p=0.975,df=11-1)
