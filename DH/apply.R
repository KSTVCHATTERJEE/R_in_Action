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

addmargins(X,1,sum)
addmargins(X,2,sum)

addmargins(X,c(1,2),sum)

addmargins(m1,c(1,2),FUN=list(sum,sd))

m2=matrix(1:12,nrow=3)
m2
addmargins(m2,c(1,2),FUN=list(list(sum,sd),list(mean,var,IQR,sum)))
addmargins(m2,c(1,1),FUN=list(sum,sd))
