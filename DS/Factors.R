#categorical(nominal) and ordered categorical(ordinal) variables = 'factors' in R
x=factor(c("Male","Female","Male"))#a factor
x
#factors are arranged alphabetically unless specified otherwise
x1=factor(c("Yes","No"))
x1
x2=factor(c("Low","Medium","High",ordered=T))
x2
x3=factor(c('yes','no','yes'),levels=c('yes','no'))#order is specified
x3
gender <- c('M','F','F','M','F')
gender
g1 <- factor(gender)
g1
months <- c('Apr','Jun','Aug','Sep')
months
month.abb[1:12]#shows all months in order
months1 <- factor(months)
months1
months2 <- factor(months,levels=month.abb[1:12],ordered=T)
#levels specified according to normal month order
months2
months3 <- c(months,'Mar')#changes the factor to a vector
months3

#nominal
diabetes <- c('Type1','Type2','Type1','Type1')#a new vector
diabetes
summary(diabetes)#summary (details) of 'diabetes'
fdiabetes <- factor(diabetes)#vector turns to factor
fdiabetes
summary(fdiabetes)#summary of factor 'fdiabetes'
fdiabetes <- c(fdiabetes,'Type3')#factor changes to vector
fdiabetes
summary(fdiabetes)
class(fdiabetes)#'character' vector
fdiabetes <- factor(diabetes)
fdiabetes#becomes a factor again
levels(fdiabetes)
fdiabetes <- factor(diabetes,levels=c(levels(fdiabetes),'Type3'))
#proper way of adding a new label 'Type3' to 'fdiabetes' (way1)
fdiabetes
summary(fdiabetes)
class(fdiabetes)#'factor'
levels(fdiabetes) <- c(levels(fdiabetes),'Type4')#level 'Type4' added (way2)
fdiabetes
levels(fdiabetes)[5] <- 'Type5'#level 'Type5' added (way3)
fdiabetes
fdiabetes[4] <- 'Type3'#4th index of 'fdiabetes' changes to 'Type3'
fdiabetes
summary(fdiabetes)
fdiabetes[5] <- 'Type6'#will add <NA> to factor as 5th index is absent
fdiabetes
sum(is.na(fdiabetes))#sum of <NA> values of 'fdiabetes'
table(fdiabetes,exclude=NULL)#excludes <NULL> from the table of factor
table(fdiabetes,exclude=NA)#excludes <NA> from the table of factor
is.na(fdiabetes)#logical function, returns TRUE if <NA> present
fdiabetes <- na.omit(fdiabetes)#omits <NA> from factor 'fdiabetes'
fdiabetes
fdiabetes[1] <- 'Type4'
fdiabetes
summary(fdiabetes)



#ordinal
clsposn <- c(1,2,3,1)#a vector
clsposn
class(clsposn)#class of 'clsposn'
summary(clsposn)#summary of 'clsposn'
mode(clsposn)
#'numeric' mode of vector 'clsposn'
fclsposn <- factor(clsposn)#vector changes to factor 'fclsposn'
fclsposn
levels(fclsposn)#levels of factor 'fclsposn'
summary(fclsposn)#returns freq dist. of each level of 'fclsposn'
fclsposn2 <- factor(clsposn, levels=c(1,2,3,4,5),ordered=T,
                    labels=c('First','Second','Third','Fourth','Fifth'))
#levels of 'fclsposn' set with labels
fclsposn2
fclsposn3 <- factor(fclsposn2,levels(fclsposn2)[c(5,3,4,2,1)])
#levels changed
fclsposn3
fclsposn3 <- factor(fclsposn2,levels(fclsposn2)[c(5,4,3,2,1)])
#levels changed
fclsposn3
print(levels(fclsposn3))
fclsposn4 <- factor(fclsposn2, levels=rev(levels(fclsposn2)))#levels reversed
fclsposn4

status <- c('Poor','Improved','Excellent','Improved')#new vector
status
fstatus <- factor(status)#vector changed to factor
fstatus
fstatus2 <- relevel(fstatus,'Poor')#'Poor' comes first
fstatus2
fstatus3 <- factor(fstatus,ordered=T,levels=c('Poor','Improved','Excellent'))
#levels changed
fstatus3
summary(fstatus3)#summary of factor 'fstatus'
table(fstatus3)#table of factor 'fstatus'
plot(status)#will yield no result as it is a vector
plot(fstatus)#will yield a barplot
plot(fstatus3)#will yield a barplot
