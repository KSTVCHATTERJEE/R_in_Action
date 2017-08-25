x=factor(c("Male","Female","Male"))
x
x1=factor(c("Yes","No"))
x1
x2=factor(c("Low","Medium","High",ordered=T))
x2
x3=factor(c('yes','no','yes'),levels=c('yes','no'))
x3
gender <- c('M','F','F','M','F')
gender
g1 <- factor(gender)
g1
months <- c('Apr','Jun','Aug','Sept')
months
month.abb[1:12]
months1 <- factor(months)
months1
months2 <- factor(months,levels=month.abb[1:12],ordered=T)
months2
months3 <- c(months,'Mar')
months3

diabetes <- c('Type1','Type2','Type1','Type1')
diabetes
summary(diabetes)
fdiabetes <- factor(diabetes)
fdiabetes
summary(fdiabetes)
fdiabetes <- c(fdiabetes,'Type3')
fdiabetes
summary(fdiabetes)
class(fdiabetes)
fdiabetes <- factor(diabetes)
levels(fdiabetes)
fdiabetes <- factor(diabetes,levels=c(levels(fdiabetes),'Type3'))
fdiabetes
summary(fdiabetes)
class(fdiabetes)
levels(fdiabetes) <- c(levels(fdiabetes),'Type4')
fdiabetes
levels(fdiabetes)[5] <- 'Type5'
fdiabetes
fdiabetes[4] <- 'Type3'
fdiabetes
summary(fdiabetes)
fdiabetes[4] <- 'Type3'
fdiabetes
fdiabetes[5] <- 'Type6'
fdiabetes
sum(is.na(fdiabetes))
table(fdiabetes,exclude=NULL)
table(fdiabetes,exclude=NA)
is.na(fdiabetes)
fdiabetes <- na.omit(fdiabetes)
fdiabetes
fdiabetes[1] <- 'Type4'
fdiabetes
summary(fdiabetes)



#ordinal
clsposn <- c(1,2,3,1)
clsposn
class(clsposn)
summary(clsposn)
mode(clsposn)
fclsposn <- factor(clsposn)
fclsposn
levels(fclsposn)
summary(fclsposn)
fclsposn2 <- factor(clsposn, levels=c(1,2,3,4,5),ordered=T,labels=c('First','Second','Third','Fourth','Fifth'))
fclsposn2
fclsposn3 <- factor(fclsposn2,levels(fclsposn2)[c(5,3,4,2,1)])
fclsposn3
fclsposn3 <- factor(fclsposn2,levels(fclsposn2)[c(5,4,3,2,1)])
fclsposn3
print(levels(fclsposn3))

fclsposn2
fclsposn4 <- factor(fclsposn2, levels=rev(levels(fclsposn2)))
fclsposn4

status <- c('Poor','Improved','Excellent','Improved')
status
fstatus <- factor(status)
fstatus
fstatus2 <- relevel(fstatus,'Poor')
fstatus2
fstatus3 <- factor(fstatus,ordered=T,levels=c('Poor','Improved','Excellent'))
fstatus3
summary(fstatus3)
table(fstatus3)
plot(status)
plot(fstatus)
plot(fstatus3)
