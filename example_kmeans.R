


library(tidyverse)
library(factoextra)
dat <- as_tibble(iris)


fviz_nbclust(dat[,1:4], kmeans, method="wss")


k_mean_res <- kmeans(dat[,1:4], centers=3, nstart=25)

dat$clusters <- as.factor(k_mean_res$cluster)

centroids <- as_tibble(k_mean_res$centers)
centroids$num <- 1:3


ggplot(dat, aes(x=Sepal.Length, y = Petal.Length)) + 
  geom_point() + theme_bw()


ggplot(dat, aes(x=Sepal.Length, y = Petal.Length, color=clusters)) + 
  geom_point() + theme_bw()



ggplot(dat, aes(x=Sepal.Length, y = Petal.Length, color=clusters, shape=Species)) + 
  geom_point() + theme_bw()



ggplot(data=dat) + 
  geom_point(data=dat, aes(x=Sepal.Length, y = Petal.Length, color=clusters, shape=Species)) + theme_bw() +
  geom_point(data=centroids, aes(y=Petal.Length, x=Sepal.Length), color="red4", size=6, alpha=.5)
