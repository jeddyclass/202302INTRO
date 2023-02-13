library(rpart)
data(iris)

np=ceiling(0.1*nrow(iris))
np

test.index=sample(1:nrow(iris), np)
iris.testdata=iris[test.index,]
iris.traindata=iris[-test.index,]
iris.tree=rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, method="class", data=iris.traindata)

iris.tree
summary(iris.tree)

plot(iris.tree); text(iris.tree)

species.traindata=iris$Species[-test.index]
train.predict=factor(predict(iris.tree, iris.traindata, type='class'), levels=levels(species.traindata))
table.traindata=table(species.traindata, train.predict)
table.traindata

correct.traindata=sum(diag(table.traindata))/sum(table.traindata)*100
correct.traindata

species.testdata=iris$Species[test.index]
test.predict=factor(predict(iris.tree, iris.testdata, type='class'), levels=levels(species.testdata))
table.testdata=table(species.testdata, test.predict)
table.testdata

correct.testdata=sum(diag(table.testdata))/sum(table.testdata)*100
correct.testdata
