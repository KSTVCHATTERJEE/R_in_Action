attach(women)
str(women)
library(DAAG)
cvfit=CVlm(data=women,form.lm=lm(weight~height,data=women),m=3,plotit="Observed")
cvfit
(76.9+8.29+15.9)/15