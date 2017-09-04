#Assignment_2
#Due Date : 5th Sept 2017

df <- read.csv(file="./Data/Assn_2_.csv")
df
str(df)
df2 <- read.csv(file="./Data/Assn_2_.csv",stringsAsFactors = F)
df2
str(df2)
?pie
pie(df2$Seats,label=df2$Party,col=c('Green','Blue','Red','Yellow'),main="WB Legislative Assembly Elections 2016 Results")

