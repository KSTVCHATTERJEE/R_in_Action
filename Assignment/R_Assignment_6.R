(x <- ceiling(seq(10,200,length.out=40)))
length(x)
mx <- matrix(x,nrow=5,byrow=F)
mx
apply(mx,1,prod)
apply(mx,2,sum)
mx_new <- mx%%10
mx_new

e <- new.env()
e$a <- matrix(1:12,nrow=4)
e$b <- array(c(1:3*4*2),dim=c(3,4,2))
e$a;e$b
mean(e$a)
mean(e$b)
class(e$a)
class(e$b)

