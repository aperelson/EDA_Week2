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

p <- g + geom_point() + geom_smooth()
p <- g + geom_point() + geom_smooth(method="lm")

p <- g + geom_point() + facet_grid(.~bmicat) + geom_smooth(method="lm")

p <- g + geom_point(color="steelblue",size=4,alpha=1/2)

p <- g + geom_point(aes(color=bmicat),size=4,alpha=1/2)

p <- g + geom_point(aes(color=bmicat)) + 
    labs(title="MAACS Cohort") + 
    labs(x = expression("log " * PM[2.5]), y = "Nocturnal Symptoms")

p <- g + geom_point(aes(color=bmicat),size=2,alpha=1/2) +
    geom_smooth(size=4, linetype=3, method="lm", se=FALSE)

p <- g + geom_point(aes(color=bmicat)) + theme_bw(base_family = "TT Times New Roman")


## Axis Limits

testdat <- data.frame(x=1:100,y=rnorm(100))
testdat[50,2] <- 100   ## Outlier
plot(testdat$x, testdat$y, type="l", ylim=c(-3,3))

g <- ggplot(testdat, aes(x=x, y=y))
g + geom_line()

## This removes the outlier!
g + geom_line() + ylim(-3,3)

## This one works the same a plot:
g + geom_line() + coord_cartesian(ylim=c(-3,3))

## Making NO2 Tertiles

## Calculate the deciles of the data:
cutpoints <- quantile(maacs$logno2_new, seq(0,1,length=4), na.rm = TRUE)

## Cut the data at the deciles and create a new factor variable:
maacs$no2dec <- cut(maacs$logno2_new, cutpoints)

## See the levels of the newly created factor variablke:
levels(maacs$no2dec)

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

## Add Layers
g + geom_point(alpha=1/3) 
  + facet_wrap(bmicat ~ mopos, nrow=2, ncol=4)
  + geom_smooth(method="lm", se=FALSE, col="steelblue")
  + theme_bw(base_size=10)
  + labs(x = expression("log " * PM[2.5]), y = "Nocturnal Symptoms")
  + labs(title="MAACS Cohort")