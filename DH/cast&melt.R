#cast and melt

(rollno <- rep(c(10,11,12,13),4))
(sname <- rep(c('Achal','Apoorva','Goldie','Hitesh'),4))
(examunit <- rep(c('u1','u2','u3','u4'),each=4))
set.seed(1234)
(rpgm <- ceiling(rnorm(16,60,10)))
(sql <- ceiling(rnorm(16,65,10)))
(df <- data.frame(rollno,sname,examunit,rpgm,sql))
(md=reshape::melt(df,id=c('rollno','sname','examunit')))
?melt
?cast
summary(md)
reshape::cast(md,rollno+sname+examunit~variable)
reshape::cast(md,rollno+variable~examunit)
reshape::cast(md,rollno+sname+variable~examunit)
reshape::cast(md,rollno~variable~examunit)
reshape::cast(md,variable+sname+examunit~rollno)
reshape::cast(md,variable+examunit~sname)

#better way
md2 <- reshape::melt(df,id.vars=c("rollno","sname","examunit"),measure.vars=c("rpgm","sql"),variable.names="subject",variable.names="Marks")
md2
