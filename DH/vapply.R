x <- list(a=1,b=1:3,c=10:100)
x
vapply(x,FUN=length,FUN.VALUE = 0L)
library(MASS)
school <- painters$School
str(painters)
tapply(painters$Composition,painters$School,mean)

(M=matrix(1:12,ncol=3))

M+1
M+c(1,2)
M
M+c(1,2,3)
cbind(M, M+c(1,2,3))

dx=colMeans(M)
sweep(M,2,dx,FUN="-")
rowMeans(M)
sweep(M,1,rowMeans(M),FUN="+")
sweep(M,1,rowMeans(M),FUN="+")
sweep(M,c(1,2),c(1:12),FUN="+")
