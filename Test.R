# Test plot
data(iris)
hist(iris$Sepal.Length,
     col='steelblue',
     main='Histogram',
     xlab='Length',
     ylab='Frequency')

#install.packages("doParallel")
library(doParallel)


nCores <- detectCores()  
registerDoParallel(nCores-6)

x <- iris[which(iris[,5] != "setosa"), c(1,5)]
trials <- 500000
ptime <- system.time({
 r <- foreach(icount(trials), .combine=cbind) %dopar% {
 ind <- sample(100, 100, replace=TRUE)
 result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
 coefficients(result1)
 }
 })[3]

ptime
