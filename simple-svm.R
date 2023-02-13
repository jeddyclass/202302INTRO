install.packages("e1071")

library(e1071)

data(iris)
index <- 1:nrow(iris)
np=ceiling(0.1*nrow(iris))
np

testindex=sample(1:nrow(iris), np)
testset=iris[test.index,]
trainset=iris[-test.index,]

svm.model<-svm(Species ~ .,
               data=trainset,
               type='C-classification',
               cost=10,
               gamma=10
               )
svm.pred<-predict(svm.model, testset[,-5])
table.svm.test=table(pred=svm.pred, true=testset[,5])
table.svm.test

correct.svm=sum(diag(table.svm.test))/sum(table.svm.test)
correct.svm=correct.svm*100
correct.svm

tuned<-tune.svm(Species ~.,
                data=trainset,
                gamma=10^(-3:-1),
                cost=10^(-1:1)
                )
summary(tuned)

model <- svm(Species ~.,
             data=trainset,
             kernel="radial",
             gamma=0.1,
             cost=10
             )
summary(model)

svm.pred <- predict(model, testset[,-5])

## compute svm confusion matrix ##
table.svm.best.test=table(pred=svm.pred,
                          true=testset[,5]
                          )
table.svm.best.test

correct.svm.best=sum(diag(table.svm.best.test))/sum(table.svm.best.test)*100
correct.svm.best

