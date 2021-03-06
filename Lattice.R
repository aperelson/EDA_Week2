library(lattice)
library(datasets)

## xyplot(y ~ x | f * g, data)

xyplot(Ozone ~ Wind, data = airquality)

## First convert Month to a factor variable:
airquality <- transform(airquality, Month=factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

## store a trellis object
p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)

#Lattice panel functions:
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each=50)
y <- x + f - f * x + rnorm(100, sd=0.5)
f <- factor(f, labels=c("Group 1", "Group 2"))
xyplot(y~x | f, layout=c(2,1))

xyplot(y ~ x | f, panel=function(x,y,...) {
    panel.xyplot(x,y,...) 
    panel.abline(h=median(y), lty=2)
    })

xyplot(y ~ x | f, panel=function(x,y,...) {
    panel.xyplot(x,y,...) 
    panel.lmline(x,y,col=2)
})