df1 <- read.csv(file='./Data/dsstudents.csv')
df1
str(df1)
head(df1[,1:2])
df2=read.csv(file='./Data/dsstudents.csv',row.names = 1)
df2
head(df2[,1:2])
df2$rollno2 = row.names(df2)
df2
df3 <- read.csv(file='./Data/dsstudents.csv',row.names=c(paste('R',1:11,sep='')))
df3
head(df3[,1:2])
?read.csv
