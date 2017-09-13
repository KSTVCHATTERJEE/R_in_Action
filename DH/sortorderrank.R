set.seed(1123)
marks <- ceiling(runif(11,5,10))
marks
marks

#sort
sort(marks)
sort(marks,decreasing = TRUE)
rev(sort(marks))

#order
order(marks)
marks
marks[order(marks)]
order(marks, decreasing=T)
order(-marks)

length(marks)
marks2 = marks
marks2
marks2[5] = NA
marks2
order(marks2)
order(marks2, na.last = NA)
length(marks2)
is.na(marks2)
anyNA(marks2)

mean(marks2)
mean(marks2, na.rm=T)
order(marks2,na.last=FALSE)
order(marks2,na.last=TRUE)
order(marks2,na.last=NA)
length(order(marks2,na.last = TRUE))
length(order(marks2,na.last = NA))

?rank
table(marks)

rank(marks, ties.method='first')
rank(marks, ties.method='average')
rank(marks, ties.method='max')
rank(marks, ties.method='random')

sort(marks2,na.last='keep')
length(sort(marks2,na.last='keep'))

rank(marks2,na.last=FALSE)
rank(marks2,na.last='keep')
