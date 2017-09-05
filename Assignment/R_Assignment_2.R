#Assignment_2
#Due Date : 5th Sept 2017

df <- read.csv(file="./Data/Assn_2_.csv") #Data stored in Excel imported in R
df
str(df) #'Party' is stored as Factor, which we do not want
df2 <- read.csv(file="./Data/Assn_2_.csv",stringsAsFactors = F)
df2 #'Party' is changed to 'character'
str(df2) #structure of the data frame is shown
pie(df2$Seats,label=df2$Party,
    col=c('Green','Blue','Red','Yellow'),
    main="WB Legislative Assembly Elections 2016 Results")
#Pie-Chart is created and printed

