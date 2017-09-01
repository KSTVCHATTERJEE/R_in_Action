#Q1
marks_Q1 <- rep(c(10,20,30,10,40,50),c(3,5,2,2,4,4))
marks_Q1
table(marks_Q1)
cbind(table(marks_Q1))
mean(marks_Q1)

#Q2_part1
marks_Q2 <- c(10,12,13,14,17)
marks_Q2
mean_Q2_1 <- mean(marks_Q2)
mean_Q2_1
obs=paste("Obs",1:5,sep='-')
obs
barplot(marks_Q2,xlab='Observations', ylab='Marks',names.arg = obs)

#Q2_part2
no_of_students <- c(5,7,9,8,4)
no_of_students
freq_obs_Q2 <- marks_Q2*no_of_students
freq_obs_Q2
sum(freq_obs_Q2)
sum(no_of_students)
mean_Q2_2 <- sum(freq_obs_Q2)/sum(no_of_students)
mean_Q2_2
barplot(no_of_students,names.arg = marks_Q2,xlab='Marks',ylab='No. of students')
#text = (x=bb,y = students....., )
#Q2_part2_other_way
new=rep(marks_Q2,no_of_students)
new
table(new)
cbind(table(new))
mean(new)
hist(new)
hist(new,breaks=3)

#Q2_part3
marks_lowerlimit <- c(10,20,30,40)
marks_lowerlimit
marks_upperlimit <- c(20,30,40,50)
marks_upperlimit
marks_midpoint <- (marks_upperlimit+marks_lowerlimit)/2
marks_midpoint
no_of_students_Q2_3 <- c(5,7,9,8)
no_of_students_Q2_3
freq_obs_Q2_3 <- marks_midpoint*no_of_students_Q2_3
freq_obs_Q2_3
mean_Q2_3 <- sum(freq_obs_Q2_3)/sum(no_of_students_Q2_3)
mean_Q2_3
x_lab <- paste(marks_lowerlimit,marks_upperlimit,sep='-')
x_lab
barplot(no_of_students_Q2_3,names.arg = x_lab,xlab='Marks',ylab='No. of students')

#Q2_part3_new_way
marks2c <- c("10-20","20-30","30-40","40-50")
students2c <- c(5,7,9,8)
df2c <- data.frame(marks2c,students2c)
df2c
str(df2c)
midpt2c <- c(15,25,35,45)
markstotal2c <- midpt2c * students2c
df2c$mid2c = midpt2c
df2c
df2c$total <- df2c$students2c * df2c$mid2c
df2c
mean2c1 <- sum(df2c$total)/sum(df2c$students2c)
mean2c1

new1 <- rep(df2c$mid2c, df2c$students2c)
table(new1)
mean(new1)

#Q3

marks_Q3 <- c(12,63,61,63,87,65,1,24,67,52,70,55,29,93,30,84,29,27,19,
           24,32,31,16,4,22,82,53,92,84,5,46,27,31,51,19,76,21,26,
           100,81,56,65,32,63,33,51,68,49,25,77)
marks_Q3
range(marks_Q3)
breaks <- seq(0,100,by=10)
breaks
marks_Q3.cut <- cut(marks_Q3,breaks,include.lowest = FALSE, right=TRUE)
marks_Q3.cut
marks_Q3.table <- table(marks_Q3.cut)
marks_Q3.table
cbind(marks_Q3.table)

#Q3_new

set.seed(1234)
x=ceiling(rnorm(100,60,15))
x
mean(x)
table(x)
range(x)
x[c(1,2,3,4,5)] <- c(0,10,11,99,100)
(brks <- seq(0,100,10)) #or brks <- seq(min(x),max(x),class size)
#if we keep the statement within braces, we don't have to print the vector again
#slabs : 0-10, 10-20, ....
classint1 <- cut(x, breaks=brks)#default right=T
head(classint1,n=5)
head(x,n=5)
table(classint1)
table(classint1,useNA='ifany')
classint2 <- cut(x,breaks=brks,right=F)
head(classint2,n=5)
head(x,n=5)
table(classint2, useNA='ifany')

#correct the problem of NA
classint1a <- cut(x, breaks=brks, include.lowest = T)
as.character(head(classint1a,n=5))
head(x,n=5)
table(classint1a, useNA='ifany')

classint2a <- cut(x, breaks=brks, include.lowest=T, right=F)
as.character(head(classint2a,n=5))
head(x,n=5)
table(classint2a,useNA='ifany')

#Giving Labels
LETTERS[1:length(brks)-1]
length(brks)
levels(classint1)
classint1b <- cut(x, breaks=brks, include.lowest=T, 
                  labels=LETTERS[1:length(brks)-1]) #default right=T 
as.character(head(classint1b,n=5))
head(x,n=5)
table(classint1b,useNA='ifany')



LETTERS[1:5]
letters[1:6]
