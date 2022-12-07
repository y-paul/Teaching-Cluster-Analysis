
library(tidyverse)
library(factoextra)


data <- read.delim("data-final.csv/data-final.csv")
data <- data[,1:50]


idx <- sample(1:length(data$EXT1), size=500)
data <- data[idx,] 
data <- data %>% mutate_all(as.numeric)
data <- na.omit(data)
fviz_nbclust(data, kmeans, method="wss")

k_mean_res <- kmeans(data, centers=8, nstart=25)


d <- dist(data, method="euclidian")
hc1 <- hclust(d, method="ward.D")
plot(hc1, cex=.2)

clust <- cutree(hc1, k=3)

data$cluster <- as.vector(clust)






fviz_cluster(list(data=data, cluster=clust))
