n <- c(2,3,5)
n
s <- c("aa","bb","cc")
s
b <- c(TRUE,FALSE,TRUE)
b
n;s;b
df=data.frame(n,s,b)
df
str(df)#structure of the created data frame
summary(df)#summay of all the vectors in the data frame
d <- c('M','F','M')
d
df1=data.frame(n,s,b,d,stringsAsFactors = T)
df1
summary(df1)
str(df1)
mtcars
str(mtcars)
?mtcars#provides more info about 'mtcars'
head(mtcars)
?head
head(mtcars,n = 2)
nrow(mtcars)
ncol(mtcars)
summary(mtcars)
mtcars[1:3]
mtcars[,1:3]
mtcars[c(1:5),]
names(mtcars)
mtcars[,"cyl"]
x=c('cyl','mpg')
mtcars[,x]
mtcars["Mazda RX4",]
rownames(mtcars)
mtcars[4:5,1:3]
mtcars["Mazda RX4","cyl"]
mtcars$am
mtcars[mtcars$mpg>25,]
mtcars[mtcars$mpg>25 & mtcars$disp>74,]
mtcars[mtcars$carb > 3 & mtcars$wt > 3,c(2,3)]
mtcars[mtcars$carb > 3 | mtcars$wt > 3,c(2,3)]
mtcars[rownames(mtcars) == 'Fiat 128',]
subset(mtcars, carb == '2')
subset(mtcars, hp == 110)
mtcars[1]
mtcars[c("mpg","hp")]
library(dplyr)
slice(mtcars,1)
slice(mtcars,c(1:4))
colnames(df) <- c("rollno","name","gender")
df
rownames(df) <- c("ID1","ID2","ID3")
df
dim(df)
colnames(df)[3]
rownames(mtcars)[8]
dim(df)[1]
dim(df)[2]
length(df)
length(mtcars)
nrow(mtcars)
ncol(mtcars)
attach(df)
gender
df
rollno
df2 <- mtcars
df2
str(df2)
df2$carb = NULL
df2
df2$gear2 = df2$gear
str(df2)
df2$mpg2 = df2$mpg*2
str(df2)
df2$mpg2 = NULL
sort(mtcars)
sort(mtcars[1,])
sort(mtcars[,1])
sort(mtcars$mpg, decreasing = T)
sort(mtcars$mpg, decreasing = F)
