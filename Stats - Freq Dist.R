attendance = c('A','A','P','P','A','P','A')
attendance
color = c("Red","Blue","Green","Magenta","Green","Black","Blue","Black")
color
summary(attendance)
no_of_siblings=c(2,1,2,4,1,0,1,2,4,2)
no_of_siblings
?import
?join
table(attendance)
table(color)
table(no_of_siblings)
?cbind
cbind(table(attendance))
barplot(table(attendance))
barplot(table(color))
barplot(table(no_of_siblings))
x_random = rnorm(100,mean=5,sd=6)
x_random
marks=ceiling(runif(50,0,100))
marks
set.seed(1234)
marks=ceiling(runif(50,0,100))
marks
marks=ceiling(runif(50,0,100))
marks
cat(marks)
range(marks)
?range
breaks=seq(0,100,by=10)
breaks
marks.cut = cut(marks,breaks)
marks.cut
marks.table=table(marks.cut)
marks.table
cbind(marks.table)
