s <- c("My First List")
s
v1 <- c(25,26,18,39)
v1
m1 <- matrix(1:10,nrow=2,byrow=T)
m1
vos <- c("one","two","three")
vos
formno <- c(17010,17045,17012)
name <- c("Achal","Apoorva","Goldie")
gender <- c('M','F','M')
formno;name;gender
stu_records <- data.frame(formno,name,gender,stringsAsFactors=F)
stu_records
str(stu_records)
mylist=list(s,v1,m1,vos,stu_records)
mylist
str(mylist)
mylist <- list(title=s,ages=v1,m1,vos,students=stu_records)
mylist
mylist[2]
mylist[3]
mylist[['ages']]
mylist$ages
sum(mylist[[3]])
mylist$students$name#names of students from the data frame in the list
mylist[[2]]
