# Assignment - 4 ----
# Student Data Manipulation ----
df3 <- read.csv(file='./Data/dsstudents2.csv') #Data is read into df3
df3 #The data frame
str(df3) #Structure of df3
anyNA(df3) #We check whether there is any NA values on the whole dataframe
is.na(df3) #we check NA values column-wise
#we change column format from factor to numeric, character and/or date
df3$name <- as.character(df3$name)
df3$email <- as.character(df3$email)
df3$city <- as.character(df3$city)
df3$dob <- as.Date(df3$dob,format='%d-%b-%y')
#we create a new column 'age'
df3$age <- ceiling(as.numeric(difftime(Sys.Date(),df3$dob,unit='weeks'))/52.25)
sum(is.na(df3)) #no. of missing values
df3[!complete.cases(df3),] #rows which have atleast one NA values
ftable(df3$hostel) #'FALSE' has more frequency
#we replace NA values with appropriate values
df3$hostel[is.na(df3$hostel)] <- FALSE #NA replaced with 'FALSE'
df3$fees[is.na(df3$fees)] <- median(df3$fees,na.rm=T) #NA replaced with median
df3$excel[is.na(df3$excel)] <- ceiling(mean(df3$excel,na.rm=T)) #NA replaced with mean
df3$sql[is.na(df3$sql)] <- median(df3$sql,na.rm=T) #NA replaced with median
df3$city[is.na(df3$city)] <- 'Delhi' #NA replaced to 'Delhi'
df3 #final updated data frame
anyNA(df3) #finally checking presence of any NA values
#Addition of new record in df3 ----
df <- data.frame(17000,'Ramesh Singh','MSCDS','',TRUE,'1994-10-17',50000,
                 'ramesh@gmail.com','','Delhi','','','','')
df #record to be updated
colnames(df) <- colnames(df3[1:14]) #column names set
#formats of all columns changed from factors to date, numeric and/or character
df$dob <- as.Date(df$dob) 
df$email <- as.character(df$email)
df$city <- as.character(df$city)
#new column 'age' created in df
df$age <- ceiling(as.numeric(difftime(Sys.Date(),df$dob,units='weeks')/52.25))#calculating age
df #final updated df to be added to df3
df3 <- rbind(df3,df) #df added to df3
df3 #updated df3
#format of numeric fields set to numeric from character
df3$mobno <- as.numeric(df3$mobno)
df3[,c('rpgm')] = as.numeric(df3[,c('rpgm')])
df3[,c('excel')] = as.numeric(df3[,c('excel')])
df3[,c('sql')] = as.numeric(df3[,c('sql')])
df3[,c('stats')] = as.numeric(df3[,c('stats')])
levels(df3$gender)[3] <- 'M'
df3$gender[is.na(df3$gender)] <- 'M' # replacing NA with male
#We will be replacing NA values of subject marks with the mean of the subject marks
df3$rpgm[is.na(df3$rpgm)] <- ceiling(mean(df3$rpgm,na.rm=T))
df3$excel[is.na(df3$excel)] <- ceiling(mean(df3$excel,na.rm=T))
df3$sql[is.na(df3$sql)] <- ceiling(mean(df3$sql,na.rm=T))
df3$stats[is.na(df3$stats)] <-ceiling(mean(df3$stats,na.rm=T))
sum(is.na(df3)) #only 1 NA value left
df3 #final updated data frame

#Summary Tables ----
#Summary Table 1
df3a <- df3[,c(11,12,13,14)]
df3a
rownames(df3a) <- df3$rollno
df3a
round(addmargins(as.table(as.matrix(df3a)),c(2,1,1),list(sum,mean,median)))

#Summary Table 2
t1 <- table(df3$course,df3$gender)
addmargins(t1)

#Summary Table 3
prop.table(t1)


#Summary Table 4
df3c <- df3[,c(1,2,11,12,13,14)]
df3c
df3c$total <- rowMeans(df3c[,c(3:6)])
df3c
grades <- function(x){
  if (x > 70){
    print('A')
  } else if (x >= 60 & x <= 70){
    print('B')
  } else {
    print('C')
  }
}
for (i in c(1:12)){
  df3c$grade[i] <- grades(df3c$total[i])
}
df3c
df3c$ranks <- rank(-df3c$total)
df3c
df3c$name[df3c$ranks==5]
df3

#Summary Table 5
df4 <- df3c[,c(3,11,12,13,14)]
df4

#Summary Table 6
split(df3[1:3],df3$course)
split(df3[1:3],list(df3$gender,df3$hostel))

#Summary Table 7
bigdata <- ceiling(runif(12,100,150))
bigdata
df3d <- df3
df3d
df3d$bigdata <- bigdata
df3d
df3d$bigdataS <- ceiling((scale(df3d$bigdata,center=F,scale=150))*100)
df3d

#Barplot
df3e <- df3d[,c('rpgm','excel','sql','stats','bigdata')]
df3e
g1 <- colMeans(df3e)
barplot(g1,main = 'Average Marks',ylim=c(0,140))
