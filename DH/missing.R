df <- read.csv(file='./Data/dsstudents2.csv') #Data stored in Data Frame
df #data frame
anyNA(df) #returns whether there is any missing value in the whole df
is.na(df) #returns whether there is any missing value in each column
table(is.na(df))
all(is.na(df))
complete.cases(df)
!complete.cases(df)
sum(complete.cases(df))
sum(!complete.cases(df))
df[complete.cases(df),1:2]
mean(df$excel)
mean(df$excel,na.rm=T)
mean(df$excel,na.rm=T,trim=.2)
mean(df$excel,na.rm=T,trim=.4)
na.omit(df$excel)
na.omit(df)[1:2]
colSums(is.na(df))
apply(df,2,function(x) sum (is.na(x)))
apply(is.na(df),2,sum)
length(which (is.na(df['excel']==T)))
df$excel[is.na(df$excel)] = mean(df$excel,na.rm=T)
df$excel
df$sql
df$sql[is.na(df$sql)] = max(df$stats,na.rm=T)
df$sql
max(df$stats)
(na_count <- sapply(df, function(y) sum(length(which(is.na(y))))))
