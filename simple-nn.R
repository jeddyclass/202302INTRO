install.packages("neuralnet")
#install.packages("DMwR")
install.packages("remotes")
remotes::install_github("cran/DMwR")

library("neuralnet")
library("DMwR")

Var1 <- runif(100, min=0, max=100)
sqrt.data <- data.frame(Var1, Sqrt=sqrt(Var1))

net.sqrt <- neuralnet(Sqrt~Var1,
                      sqrt.data,
                      hidden=10,
                      threshold=0.01
                      )
print(net.sqrt)

plot(net.sqrt)

testdata <- as.data.frame((1:10)^2)
nn.result <- compute(net.sqrt, testdata)
print(nn.result)

regr.eval(testdata[,1],
          nn.result$net.result[,1],
          stats=c('mae', 'rmse')
          )
