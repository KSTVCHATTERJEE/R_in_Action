#Q1 ----
(x <- ceiling(seq(10,200,length.out=40)))
length(x)
mx <- matrix(x,nrow=5,byrow=F)
mx
apply(mx,1,prod)
apply(mx,2,sum)
mx_new <- sweep(mx,1,10,FUN="%%")
mx_new
mx_new_2 = sweep(mx,1,2,FUN='%%')
mx_new_2
apply(mx_new_2,2,sum)

library(datasets)
iris
ag <- aggregate(iris$Sepal.Length,list(x$Species),FUN=mean,na.rm=TRUE)
ag

#Q2----
e <- new.env()
e$a <- matrix(1:12,nrow=4)
e$b <- array(c(1:3*4*2),dim=c(3,4,2))
e$a;e$b
eapply(e,mean)
class(e$a)
class(e$b)

#Q3 ----
(list1 = list(1:20,55:100,mtcars$mpg,mtcars$wt))
lapply(list1,sum)
(vector_results_q3 = sapply(list1,sum))


#Q4 ----
a1 <- array(c(1:24),dim=c(4,3,2))
a1
sweep(a1,1,mean(a1),FUN="-")

attach(attitude)
str(attitude)
med = apply(attitude,2,median)
med
sweep(attitude,2,med,FUN="-")

A <- array(c(1:24),dim=c(4,3,2))
A
sweep(A,1,5,FUN="-")

min_A = apply(A,1,min)
min_A
sweep(A,1,min_A,FUN="-")
sweep(A,1:2,apply(A,1:2,median))

sweep(A,1,1:3)
sweep(A,1,6:1)

sweep(A,1,1:2)

#Q5 ----
library(reshape2)
x = data.frame(subject = c("Lalit","Vijay"),time=c(1,1), 
               age = c(33,NA), weight=c(80,NA), height = c(2,2))
x
melt(x)
is.na(x)
x[!complete.cases(x),]
colSums(is.na(x))
y=melt(x)
y1=y[-c(4,6),]
y1
x
y = melt(x)
y
dcast(y1,subject~variable)
acast(y,subject~variable)
?acast
#Q6 ----
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
course =  c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS', 'PGDDS','PGDDS','PGDDS')
gender = c('M','F','M','M','M','F','M','F','M','M','M')
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8) # Experience
hostel =  c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
df1 = data.frame(rollno,sname,course)
df2 = data.frame(rollno, gender, exp, hostel)
merge(df1,df2)
ID = c(17010,17045,17012,1)
SEX = c('M','F','M','M')
SUB1 = c(50,60, 70,80)
(df3 = data.frame(ID, SEX, SUB1))
df1$gender = gender
merge(df1,df3,by.x = c('rollno','gender'),by.y = c('ID','SEX'))
merge(df1,df3,by.x=c('rollno'),by.y = c('ID'),all = T)
merge(df1,df3,by.x='rollno',by.y = 'ID',all.x=T)
merge(df1,df3,by.x=c('rollno'),by.y = c('ID'),all = F)
merge(df1,df3,by.x='rollno',by.y = 'ID',all.y=T)

#Q7 ----
classmarks=data.frame(classA = c(10,14,15),classB = c(20,25,27),classC = c(13,15,17))
classmarks
stack(classmarks)
?stack
d=stack(classmarks,c("classA","classC"))
d
unstack(d)

#Q8 ----
df_new=read.csv("./Data/dsstudents.csv",na.strings=' ')
df_new
b = by(df_new[,c(11,12,13,14,7)],INDICES=df_new$course,summary)
b

#Q9 ----
ag2 = aggregate(mtcars,by=list(mtcars$cyl),FUN='mean')
ag2
ag3 = aggregate(mtcars,by=list(mtcars$am),FUN='mean')
ag3
ag4 = aggregate(df_new[,c('rpgm','excel','stats','sql')],by=list(df_new$hostel),FUN='sum')
ag4
ag5 = aggregate(df_new[,c('rpgm','excel','stats','sql')],by=list(df_new$gender),FUN='sum')
ag5