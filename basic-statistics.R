install.packages("skimr")
library(skimr)

#skim(data)
skim(iris) 

summary(iris)

head(iris)   # first 6 data

str(iris)    # show column status

class(iris$Species)

table(iris$Species) # nums in classes

# historgam plot
hist(iris$Sepal.Length)

# bar chart
barplot(table(iris$Species))

# pi chart
pie(table(iris$Species))

# scatter chart
plot(iris$Sepal.Length,iris$Petal.Length)

# box plot
boxplot(iris$Sepal.Length)

# Steam-and-leaf plot
stem(iris$Sepal.Length)

# draw scatter diagram, histogram, & correlation values for first 4 vars
install.packages("psych")
library(psych)

data(iris)
pairs.panels(iris[1:4],
             gap = 0,   # gaps between charts
             bg = c("red", "green", "blue")[iris$Species],
             pch = 21)  # pch shpae
