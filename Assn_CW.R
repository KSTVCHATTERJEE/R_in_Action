#Q2_part2_other_way
new=rep(marks_Q2,no_of_students)
new
table(new)
cbind(table(new))
mean(new)
hist(new)
hist(new,breaks=3)

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
