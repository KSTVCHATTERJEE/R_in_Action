# R - Practice
#ST33062P
#Question - 1 ----
gender <- c('M','M','F','F','M','M','M','F','M','F','F','M','F','M','F')
systolic <- c(139,125,142,99,101,136,145,100,169,130,125,89,150,152,142)
diastolic <- c(82,85,91,100,104,88,97,70,107,92,95,88,61,78,99)
df1 <- data.frame(gender,systolic,diastolic)
df1
mean(df1$systolic[which(df1$gender=='M')]) #average of systolic blood pressure for males
mean(df1$diastolic[which(df1$gender=='M')])#average of diastolic blood pressure for males
mean(df1$systolic[which(df1$gender=='F')])#average of systolic blood pressure for females
mean(df1$diastolic[which(df1$gender=='F')])#average of diastolic blood pressure for females

length(which(df1$systolic > 140 & df1$gender == 'M')) #males with systolic BP > 140

mean(df1$systolic[which(df1$diastolic > 140)]) #average of systolic BP where diastolic BP > 140

#Question - 2 ----
ds1 <- c(10,20,30,40,50,60,70,80,90,100,110,120)
ds2 <- c(1,2,3,4,5,6,7,8,9,100,110,120)
ds3 <- c(10,10,11,70,71,72,73,74,75,76,77,78,79)
boxplot(ds1,ds2,ds3)

#Question - 3 ----

years <- c(1961,1971,1981,1991,2001)
sexratio <- c(941,930,934,927,933)
plot(years,sexratio,type='l')

#Mock Test Paper
(x=11:20)
for(i in 1:10){
  if((i==2) | (i==5) | (i==7))
    print(x[i]^2)
}

sqroot <- function(i){
    print(sqrt(x[i]))
  }
for(j in 1:10){
  sqroot(j)
}

f <- function(a,b){a^2}
f(2)

paste("a","b",sep=":")

log(-1)
args(f)

seq(4)
seq_along(4)
?seq_along
v1=x+c(NA)
class(v1)
paste("Data","Science","from","MUIT",sep="-")
