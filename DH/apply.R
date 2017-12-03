(v1=1:24)
(s <- c('s1','s2'))
(d <- c('d1','d2','d3'))
(c <- c('c1','c2','c3','c4'))
(a1 <- array(v1,c(4,3,2),list(c,d,s)))
(m1 <- matrix(c(10:1,rep(5,10),rep(c(5,6),5),1:10),ncol=4,byrow=F))
(rownames(m1) <- paste('R',1:10,sep=''))
(colnames(m1) <- paste('sub',1:4,sep=''))
m1
(df1 <- data.frame(sub1=10:1,sub2=5,sub3=rep(c(5,6),5),sub4=1:10))
(list1<-list(sub1=10:1,sub2=rep(5,3),sub3=rep(c(5,6),5),sub4=1:10))
a1
m1
df1
list1
?apply
(X=a1)
apply(X,1,sum)
apply(X,1,mean)

apply(X,2,sum)
apply(X,3,sum)
apply(X,c(1,2),sum)

apply(X,c(2,3),sum)

?addmargins
addmargins(X,1,sum)
addmargins(X,2,sum)

addmargins(X,c(1,2),sum)
addmargins(X,3,sum)


addmargins(m1,c(1,2),FUN=list(sum,sd))

m2=matrix(1:12,nrow=3)
m2
addmargins(m2,c(1,2),FUN=list(list(sum,sd),list(mean,var,IQR,sum)))
addmargins(m2,c(1,1,1),FUN=list(sum,sd,mean))

addmargins(m2,c(1,2),FUN=list(sum,list(mean,var,IQR,sum)))

#vapply ----
x <- list(a=1,b=1:3,c=10:100)
x
vapply(x,FUN=length,FUN.VALUE = 0L)
?vapply
library(MASS)
school <- painters$School
str(painters)
?tapply
tapply(painters$Composition,painters$School,mean)
aggregate(painters$Composition,list(painters$School), mean)
?aggregate
by(painters$Composition,painters$School,mean)
?by
(M=matrix(1:12,ncol=3))

M+1
M+c(1,2)
M
M+c(1,2,3)
cbind(M, M+c(1,2,3))
?sweep
(dx=colMeans(M))
sweep(M,2,dx,FUN="-")
rowMeans(M)
sweep(M,1,rowMeans(M),FUN="+")
apply(M,1,mean)
addmargins(M,2,mean)
sweep(M,1,rowMeans(M),FUN="+")
sweep(M,c(1,2),c(1:12),FUN="+")

#eapply ----
A <- c(1,3,5,7,9)
B <- c(0,3,6,9,12)
C <- list(x=1,y=2)
D <- function(x){x+1}

ls()
lsf.str()
?eapply
eapply(.GlobalEnv,is.function)
unlist(eapply(.GlobalEnv,is.function))
unlist(eapply(.GlobalEnv,is.vector))

mtcars
mtcars$am
mtcars$am;mtcars$mpg
?by
by(mtcars$mpg,mtcars$am,FUN=mean)

by(warpbreaks[,1:2],warpbreaks[,"tension"],summary)

by(data=mtcars[,'disp'],INDICES=mtcars[,c('vs','am')], mean)

#sapply & mapply ----
m1 <- matrix(1:16,nrow=4)
m1
for(i in 1:nrow(m1)){
  print(paste0('Mean of row ',i,' is ',mean(m1[i,])))
  print(paste0('Mean of col ',i,' is ',mean(m1[,i])))
}
rowMeans(m1)
colMeans(m1)

addmargins(m1,c(1,2),FUN=mean)

apply(m1,1,mean)
apply(m1,2,mean)

a1 <- array(1:24,dim=c(3,4,2))
a1
?array
apply(a1,1,sum)
apply(a1,2,sum)
apply(a1,3,sum)
apply(a1,c(1,2),sum)
apply(a1,c(2,3),sum)
apply(a1,c(1,2,3),sum)
apply(a1,c(1,3),sum)


(l1 <- list(a=1,b=1:3,c=10:100))
?lapply
lapply(l1,FUN=length)
lapply(l1,FUN=sum)

sapply(l1,FUN=sum)

#lapply gives the output in list form
#sapply gives the output in vector form

sapply(1:5,function(x) rnorm(3,x)) #rnorm(3,x)is the func body of function(X)

sapply(1:5,function(x) matrix(x,2,2))

Q2 <- mapply(rep,1:4,4)
Q2
?mapply

mapply(function(x,y) x^y,x=c(2,4),y=c(3,2))
mapply(function(x,y) {x^y},x=c(a=2,b=4),y=c(A=3,B=2))

mapply(function(x,y) x^y,x=c(2:10),y=c(3:5))

mapply(function(x,y,z,k){(x+k)^(y+z)},x=c(a=2,b=3),y=c(A=3,B=4),z=c(1,1),k=c(2,2))
#MoreArgs(list(1,2))