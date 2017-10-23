(x <- ceiling(seq(10,200,length.out=40)))
length(x)
mx <- matrix(x,nrow=5,byrow=F)
mx
apply(mx,1,prod)
apply(mx,2,sum)
mx_new <- mx%%10
mx_new
