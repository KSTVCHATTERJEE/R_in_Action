data <- read.csv(file.choose())
str(data)
summary(data)
colSums(is.na(data))

library(caret)
preproc <- preProcess(data)
airlinesNorm <- predict(preproc,data)
summary(airlinesNorm)

#Hierarchical Clustering
distan <- dist(airlinesNorm, method = "euclidean")
ClusterAirline <- hclust(distan, method="ward.D")
plot(ClusterAirline)

AirlineCluster <- cutree(ClusterAirline,k=5)
table(AirlineCluster)

MeanComp <- function(var,clustergrp,meas){
  z<-tapply(var,clustergrp,meas)
  print(z)
}

Bal_mean <- MeanComp(data$Balance, AirlineCluster, mean)

#k-means clustering
set.seed(88)
k <- 5
AirlineCluster_k <- kmeans(airlinesNorm, centers=k, iter.max = 1000)
table(AirlineCluster_k$cluster)
AirlineCluster_k$centers

Bal_mean_k <- aggregate(data, by=list(cluster=AirlineCluster_k$cluster),mean)
Bal_mean_k

Airines_h <- data.frame(data,AirlineCluster)
Airines_h
