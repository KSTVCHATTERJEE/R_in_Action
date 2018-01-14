newdata <- read.csv(file.choose())
newdata
as.data.frame(colSums(is.na(newdata)))
str(newdata)
summary(newdata)
table(newdata$not.fully.paid)

library(Amelia)
missmap(newdata)

library(mice)
set.seed(144)
vars.for.imputation = setdiff(names(newdata), "not.fully.paid")
imputed = complete(mice(newdata[vars.for.imputation]))
newdata[vars.for.imputation] = imputed
as.data.frame(colSums(is.na(newdata)))
