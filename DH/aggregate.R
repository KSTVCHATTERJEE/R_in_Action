df2
aggregate(df2$fees, list(Course=df2$course), sum)
aggregate(cbind(df2$fees,df2$excel),list(DSCourse=df2$course,Gender=df2$gender),sum)
split(df2[1:3], df2$gender)
split(df2[1:3], df2$gender)$F
paste0('a','b','c')
search()
(v1=1:20)
diff(v1)
trunc(4.32)
v2 <- ceiling(runif(12,40,60))
v2
cummax(v2)
(v4=1:5)
cumprod(v2)
cumprod(v4)
scale(v4)
