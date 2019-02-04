##################################
#     FUN IN H2O                 #
##################################

library(h2o)
h2o.init()

# Data Preparation ##################
url <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/iris/iris_wheader.csv"
iris <- h2o.importFile(url)

parts <- h2o.splitFrame(iris,0.8)
train <- parts[[1]]
test <- parts[[2]]


# Random Forest #######################
mRF <- h2o.randomForest(1:4, 5, train)
mRF
#p <- h2o.predict(mRF, test)
h2o.performance(mRF, test)
?h2o.randomForest #How to view the Random Forest model "Help Page"



# Gradient Boosting Estimator ##########
mGBM <- h2o.gbm(1:4, 5, train)
mGBM
#p <- h2o.predict(mGBM, test)
h2o.performance(mGBM, test)
?h2o.gbm #How to view the gradient boosted classification or regression trees "Help Page"