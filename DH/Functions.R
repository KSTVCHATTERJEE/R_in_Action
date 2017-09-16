load(file='./Data/KC3.RData')
df2


x=2 ; y=3
(sumofnos = x+y)

x1=c(1:10)
(sumofnos = sum(x1))

fsum1 <- function(x1) {
  sum(x1)/length(x1)
}
fsum1
fsum1(1:10)
sumofnos <- fsum1(1:10)
sumofnos

fsum2 <- function(x1) {
  sumofnos=sum(x1)
  return(sumofnos)
}
fsum2(1:10)

fsum2a <- function(x1) {
  
  sumofnos=sum(x1)

}

sum2a <- function(x3, y3) {
  
  sumofnos = sum(x3) * mean(y3)
  return(sumofnos)
}
x1=1:10; y1=100:200
sum2a(x1,y1)

fsum3 <- function(x1) {
  sumofnos = sum(x1)
  print(sumofnos)
  print(paste('Sum of object is',sumofnos,sep=' '))
  cat(paste('SUm of my object is',sumofnos, sep=' '))
} 

fsum3(x1)

body(fsum3) #prints function body
args(fsum3)

area_circle <- function(pi, r) {
  
  areacircle = pi*(r^2)
  return(areacircle)
}

area_circle(pi,7)
args(bxp)
area_circle(3,4)
area_circle(r=4,pi=3)

args(area_circle)
lsf.str()
search()
ls()

lsf.str(pos=3)
lsf.str(pos=-1)

save(area_circle, file='./Data/KC3.RData')
load('./Data/KC3.RData')

args(area_circle)
(ch1 = deparse(args(area_circle)))
str(ch1)

areacircle2 <- function(constant=3.14,r) {
  areacircle2 = constant * r^2
  invisible(areacircle2)
}
areacircle2(r=5)
(ch=areacircle2(r=5))

pi
print(pi)
print(pi,digits=2)
df2
print(df2$name,quote=F)

