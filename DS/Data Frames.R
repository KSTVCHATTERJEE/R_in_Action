n <- c(2,3,5)# a numeric vector
n#prints n
s <- c("aa","bb","cc")# a character vector
s#prints s
b <- c(TRUE,FALSE,TRUE)# a logical vector
b#prints b
n;s;b#prints n,s,b simultaneously
df=data.frame(n,s,b)# data frame is created
df#prints 'df'
str(df)#structure of the created data frame
summary(df)#summary of all the vectors in the data frame
d <- c('M','F','M')#a new character vector
d
df1=data.frame(n,s,b,d,stringsAsFactors = T)#a new data frame is created
#stringsAsFactors = converts strings into factors
df1
summary(df1)#summary of df1
str(df1)#structure of df1
mtcars#an existing data-frame in R
str(mtcars)#structure of mtcars
?mtcars#provides more info about 'mtcars'
head(mtcars)#returns the 1st or last part of an object
?head#provides more info about 'head'
head(mtcars,n = 2)#prints the first 2 rows of 'mtcars'
nrow(mtcars)#number of rows of 'mtcars'
ncol(mtcars)#number of columns of 'mtcars'
summary(mtcars)#summary of 'mtcars'
mtcars[1:3]#prints first 3 columns of 'mtcars'
mtcars[,1:3]#same as above
mtcars[c(1:5),]#prints first 5 rows of 'mtcars'
names(mtcars)#prints names of columns of 'mtcars'
mtcars[,"cyl"]#values of all cars under the column 'cyl'
x=c('cyl','mpg')
mtcars[,x]#values of all cars under the column 'cyl' & 'mpg'
mtcars["Mazda RX4",]#prints records of "Mazda RX4"
rownames(mtcars)#prints row names of 'mtcars'
mtcars[4:5,1:3]#prints 4th, 5th row & 1st,2nd column of 'mtcars'
mtcars["Mazda RX4","cyl"]#prints 'cyl' values of 'Mazda RX4'
mtcars$am#prints 'am' column of 'mtcars'
mtcars[mtcars$mpg>25,]#prints all records of cars with mpg>25
mtcars[mtcars$mpg>25 & mtcars$disp>74,]
#prints all records of cars with mpg>25 & disp>74
mtcars[mtcars$carb > 3 & mtcars$wt > 3,c(2,3)]
#prints records of cars with carb>3 & wt>3, alongwith 2nd & 3rd column of 'mtcars'
mtcars[mtcars$carb > 3 | mtcars$wt > 3,c(2,3)]
#prints records of cars with carb>3 & wt>3, alongwith 2nd & 3rd column of 'mtcars'
mtcars[rownames(mtcars) == 'Fiat 128',]#prints all records of 'Fiat 128'
subset(mtcars, carb == '2')#prints records of those cars for which carb=2
subset(mtcars, hp == 110)#prints records of those cars for which hp=110
mtcars[1]#prints first column of 'mtcars'
mtcars[c("mpg","hp")]#prints 'mpg' & 'hp' column of 'mtcars'
library(dplyr)#a new package 'dplyr' is downloaded and installed
slice(mtcars,1)#prints 1st row of 'mtcars'
slice(mtcars,c(1:4))#prints 1st to 4th row of 'mtcars'
colnames(df) <- c("rollno","name","gender")#column names changed to given vector
df#prints df
rownames(df) <- c("ID1","ID2","ID3")#row names changed to given vector
df#prints df
dim(df)#dimension of df
colnames(df)[3]#prints 3rd column name of df
rownames(mtcars)[8]#prints name of 8th row of 'mtcars'
dim(df)[1]#prints number of rows of df
dim(df)[2]#prints number of columns of df
length(df)#prints number of columns of df
length(mtcars)#prints number of 'mtcars'
nrow(mtcars)#prints number of rows of 'mtcars'
ncol(mtcars)#prints number of columns of 'mtcars'
attach(df)#objects of 'df' can be accessed by just their names
gender#a vector of df (accessed separately)
df#prints df
rollno#a vector of df (accessed separately)
df2 <- mtcars#'mtcars' copied into 'df2'
df2#prints df2
str(df2)#structure  of 'df2'
df2$carb = NULL#makes the 'carb' column of 'df2' blank/null
df2#prints 'df2' with 'carb' being null
df2$gear2 = df2$gear#copies values of 'gear'into 'gear2'
str(df2)#prints structure of df2 with 'gear2' included
df2$mpg2 = df2$mpg*2#copies values of 'mpg'*2 into 'mpg2'
str(df2)#prints structure of df2 with 'mpg2' included
df2$mpg2 = NULL#makes the column 'mpg2' of 'df2' blank/null
sort(mtcars)#error
sort(mtcars[1,])#row-wise sorting
sort(mtcars[,1])#column-wise sorting
sort(mtcars$mpg, decreasing = T)#sorts 'mpg' in decreasing order
sort(mtcars$mpg, decreasing = F)#sorts 'mpg' in ascending order
