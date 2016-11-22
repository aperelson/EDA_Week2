library(ggplot2)
str(mpg)

## Scatterplot uses two values - x & y:

qplot(displ, hwy, data=mpg)

qplot(displ, hwy, data=mpg, color=drv)

qplot(displ, hwy, data=mpg, geom = c("point","smooth"))

qplot(displ, hwy, data=mpg, fill=drv)


## Histogram only uses one value:

qplot(hwy, data=mpg, fill=drv)


## Facets:

qplot(displ, hwy, data = mpg, facets=.~drv)

qplot(hwy, data = mpg, facets=drv~.,binwidth=2)


## building up in layers:
load("maacs.rda")
head(maacs[, c("logpm25","bmicat","NocturnalSympt")])

g <- ggplot(maacs, aes(logpm25,NocturnalSympt))
p <- g + geom_point()
print(p)




