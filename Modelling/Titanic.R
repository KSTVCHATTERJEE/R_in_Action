# Load packages
library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression# Read Data
dataset <- read.csv("./Data/train.csv",stringsAsFactors = F,na = "")
# First few entries of the data
head(dataset)
str(dataset)
colSums(is.na(dataset))
table(dataset$Embarked)
dataset$Embarked[is.na(dataset$Embarked)]="S"
table(dataset$Embarked)
?iris
?t.