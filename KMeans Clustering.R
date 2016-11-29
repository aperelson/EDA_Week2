set.seed(1234)
x <- rnorm(12, mean=rep(1:3, each=4), sd=0.2)
y <- rnorm(12, mean=rep(c(1,2,1), each=4), sd=0.2)

plot(x,y)

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers=3)
names(kmeansObj)

par(mar=rep(0.2,4))
plot(x,y,col=kmeansObj$cluster, pch=19, cex=2)
points(kmeansObj$centers, col=1:3, pch=3, cex=3, lwd=3)