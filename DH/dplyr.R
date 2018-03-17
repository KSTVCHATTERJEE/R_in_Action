attach(iris)
dplyr::tbl_df(iris)
print(dplyr::tbl_df(iris),n=30)
library(dplyr)
tbl_df(iris) %>% print(n=Inf)
tbl_df(iris) %>% print(width=5)
tbl_df(iris) %>% as.data.frame(iris)

glimpse(iris)
View(iris)

iris %>% select(Species)

mtcars %>% select(vs, mpg, wt)
mtcars %>% group_by(cyl) %>% summarise(avg = mean(wt), avg_hp = mean(hp))

mtcars %>% group_by(cyl) %>% summarise(avgwt = mean(wt), avg_hp = mean(hp)) %>% arrange(avgwt)


mtcars %>% group_by(cyl) %>% summarise(avgwt = mean(wt), avg_hp = mean(hp)) %>% arrange(avgwt, desc(avg_hp))

filter(mtcars, mpg>23)

mtcars %>% filter(mpg>23)

filter(mtcars, mpg>23 | wt<2)

filter(iris, Species == 'virginica')

filter(iris, Sepal.Length > 4)
df = mtcars[1:4]
rename(df, MPG=mpg)
sample_frac(mtcars,0.5, replace=T)
sample_n(mtcars,10,replace=T)

sample_n(mtcars,2,replace=T) %>% select(mpg)
slice(mtcars,1:4)

top_n(mtcars,2, mpg)

select(mtcars, mpg) %>% arrange(mpg)
top_n(mtcars,-2, mpg)

select(iris, contains("."))
select(mtcars, contains("wt"))
select(mtcars,  everything())
select(iris,matches(".p."))
select(iris,matches("p."))

dplyr::summarise_each(mtcars, funs(mean,median))


mtcars %>% group_by(cyl,am) %>% summarise_all(mean)

dplyr::mutate_each(mtcars,funs(min_rank))

dplyr::transmute(iris, sepal=Sepal.Length+Sepal.Width)

a=data.frame(x1=c('A','B','C'),x2=c(1,2,3))
b=data.frame(x1=c('A','B','D'),x3=c('T','F','T'))
a
b
dplyr::left_join(a,b,by="x1")
dplyr::right_join(a,b,by="x1")
dplyr::inner_join(a,b,by="x1")
dplyr::full_join(a,b,by="x1")
