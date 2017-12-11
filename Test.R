#Question - 1 ----
(sd=paste("01",month.abb[1:6],"2016",sep="-"))
(sd1=as.Date(sd,"%d-%b-%Y"))
(saledate=rep(sd1,times=4))
(dept=rep(c("Dept1","Dept2"),each=12))
(dept=factor(dept,ordered=T,levels=c("Dept1","Dept2")))
(city=rep(c("Delhi","Noida"),times=2,each=6))
set.seed(1234)
(saleamt=runif(24,100,200))
set.seed(1234)
(advamt=ceiling(runif(24,25,40)))
(df=data.frame(saledate,dept=as.factor(dept),city=as.factor(city),saleamt,advamt))
str(df)

#Manipulation ----
(t1=xtabs(round(saleamt,0)~dept+city,data=df))
margin.table(t1,c(2))
addmargins(t1,c(1,2),FUN=list(list(sd,mean),sum))
prop.table(t1)*100
(df2=df[(which(df$city=="Noida")),c(2,4,5)])
df2[order(df2$saleamt,-df2$advamt),]
with(df2,plot(x=dept,y=saleamt))
within(df2,profit <- saleamt-advamt)
sweep(df2[2:3],1,1,FUN="+")
library(reshape2)
melt(df2,id="dept")

#Descriptive Stats ----
plot(y=df2$saleamt,x=df2$advamt)
abline(lm(df2$saleamt~df2$advamt))
cor(df2$saleamt,df2$advamt)

#Graph ----
with(df,boxplot(saleamt~dept))
with(df,boxplot(saleamt~dept+city))
agdepcity=aggregate(df$saleamt,by=list(dept,city),FUN=mean)
agdepcity
pie(agdepcity$x,labels=paste(agdepcity$Group.1,agdepcity$Group.2,sep="-"))

#Question - 2 ----
attach(airquality)
str(airquality)
dim(airquality)
colnames(airquality)
summary(airquality)
aggregate(airquality[,c(1,2,3,4,6)],by=list(airquality$Month),FUN=mean,na.rm=T)

#Matrix Operations ----
(matrix1=as.matrix(airquality))
colSums(is.na(matrix1))
sapply(matrix1[,1],function(x) all(is.na(x)))

matrix1[which(is.na(matrix1[,1])),1]=mean(matrix1[,1],na.rm=T)
matrix1[which(is.na(matrix1[,1])),1]
matrix1
apply(matrix1,2,mean,na.rm=T)
matrix1[which(is.na(matrix1[,2])),2]=mean(matrix1[,2],na.rm=T)
matrix1
apply(matrix1,2,mean)
sapply(matrix1[1:10],log)

#Question - 3 ----
(dept = paste('D',1:2,sep=""))
(courses = paste('C',1:3,sep=""))
(subjects = paste('Sb',1:4,sep=""))
(students = paste('S',1:5,sep=""))
(subarray=array(rnorm(5*4*3*2,50,10),c(5,4,3,2),dimnames=list(students,subjects,courses,dept)))
apply(subarray,c(2),max)
apply(subarray,c(4),mean)
apply(subarray,c(1,3,4),sum)
apply(subarray,c(2),sd)

#Question - 4 ----
(rollno = c(100:120))
(school = "Data Science")
(course = c("PG","MSc"))
(l1=list(rollno,school,course))
length(l1$rollno)

