s <- c("My First List")#a string
s
v1 <- c(25,26,18,39)#a numeric vector
v1
m1 <- matrix(1:10,nrow=2,byrow=T)#a numeric matrix
m1
vos <- c("one","two","three")#a string vector
vos
#data frame building starts
formno <- c(17010,17045,17012)
name <- c("Achal","Apoorva","Goldie")
gender <- c('M','F','M')
formno;name;gender
stu_records <- data.frame(formno,name,gender,stringsAsFactors=F)
stu_records
#data frame building ends
#stringsAsFactors makes sure strings are not stored as factors
str(stu_records)
mylist=list(s,v1,m1,vos,stu_records)#list gets created
mylist
str(mylist)#structure of mylist
mylist <- list(title=s,ages=v1,m1,vos,students=stu_records)
#s, v1 and stu_records gets renamed as title, ages and students respectively 
mylist#changes shown
mylist[2]#2nd object of list 
mylist[3]#3rd object of list
mylist[['ages']]#2nd object of list (renamed as 'ages')
mylist$ages#prints 'ages' object of mylist
sum(mylist[[3]])#prints sum of elements of 3rd object of the list
mylist$students$name
#prints 'name' column of 'students' object (previously stu_records) of list
mylist[[2]]#2nd object of list
