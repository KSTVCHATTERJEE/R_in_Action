getwd()
?read.csv
df1 <- read.csv(file='./Data/dsstudents.csv')
df1
str(df1)
df2 <- read.csv(file='./Data/dsstudents.csv', stringsAsFactors = F)
df2
str(df2)
df2$course <- factor(df2$course)
str(df2)
df2$gender <- factor(df2$gender)
str(df2)
head(df2)[1:4]
tail(df2)[1:2]
head(df2)[1:4,]
?head
head(df2,n=4)[1:4]
table(df2$gender)
table(df2$gender,df2$course)
table(df2$gender=='M' & df2$course=='MSCDS')
df2[c('name','gender')] #display name and gender
names(df2) #column names
row.names(df2) #row names
df2$rollno
df2$rollno[df2$rollno==170113]
df2$rollno[df2$rollno==170113] = 17013 #change rollno from 170113 to 17013
df2$rollno #check rollno column
df2$rollno[df2$name=='Lalit Sahni']
fix(df2) #edit data frame and save back
