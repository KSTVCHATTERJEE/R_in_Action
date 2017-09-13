df1 <- read.csv(file='./Data/dsstudents.csv')
df1
class(df1)
df1a <- read.csv(file=file.choose()) #used to extract files from any location
str(df1)
names(df1)
colcls <- c('numeric', 'character', 'factor', 'factor', 'logical','character','numeric','character','character','character',rep('numeric',4))
df2 <- read.csv(file='./Data/dsstudents.csv',colClasses=colcls,as.is=T) #as.is for name
str(df2)
as.Date('1967-20-15') #wrong
as.Date('1967-10-15')
?as.Date
as.Date('05-Oct-1966',format="%d-%b-%Y")
#%d = 05,21,etc
#%b = Jan
#%B = January
#%m = 01
#%y = 17
#%Y = 2017
(df2$dob <- as.Date(df2$dob,format='%d-%b-%y'))
str(df2)
df2$age <- ceiling(as.numeric((difftime(Sys.Date(),df2$dob,unit='weeks'))/52.25))
df2$age         
df2$age > 30
df2[df2$age > 30,][1:2]
df2[df2$gender == 'M' & df2$course == 'PGDDS',][1:2]
df2[df2$gender == 'M' & df2$course == 'PGDDS',1:2]
df2[df2$gender == 'M' & df2$course == 'PGDDS',c(1,2)]
df2[df2$gender == 'M' & df2$course == 'PGDDS',c('name','rollno')]
summary(df2)
str(df2)
?write.csv
write.csv(x=df2,file='./Data/Kaustav.csv') #save to CSV
saveRDS(object=df2,file='./Data/KC.RDS') #only 1 object at a time
markstotal <- runif(11,50,150)
markstotal
save(markstotal,df2,file='./Data/KC2.RData') #save multiple objects in R
save.image(file='./Data/KC3.RData') #save all current objects/multiple objects in R

readRDS(file='./Data/KC.RDS')
mydata = readRDS(file='./Data/KC.RDS') #save it into object
#load() #for data in .RData this happens automatically
load(file='./Data/KC2.RData')
load(file='./Data/KC3.RData')

df2[df2$hostel == TRUE,][1:2] #stay in hostel
?which
which(df2$hostel==TRUE) #using which comad Tells indices
df2[which(df2$hostel == TRUE),][c(1,2,4,5)] #in hostel
df2[which(!df2$hostel == TRUE),][c(1,2,4,5)] #not in hostel

#Sort

