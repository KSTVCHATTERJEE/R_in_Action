A <- c(1,3,5,7,9)
B <- c(0,3,6,9,12)
C <- list(x=1,y=2)
D <- function(x){x+1}
ls()
lsf.str()

eapply(.GlobalEnv,is.function)
unlist(eapply(.GlobalEnv,is.function))
unlist(eapply(.GlobalEnv,is.vector))

mtcars
mtcars$am
mtcars$am;mtcars$mpg
by(mtcars$mpg,mtcars$am,FUN=mean)

by(warpbreaks[,1:2],warpbreaks[,"tension"],summary)

by(data=mtcars[,'disp'],INDICES=mtcars[,c('vs','am')], mean)
