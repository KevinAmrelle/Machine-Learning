##################################
#     FUN IN H2O                 #
##################################

library(h2o)
h2o.init()

# Pulling Iris H2O Dataset ##########
url <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/iris/iris_wheader.csv"
iris <- h2o.importFile(url)

# Data Preparation ##################
parts <- h2o.splitFrame(iris,0.8)
train <- parts[[1]]
test <- parts[[2]]

# Deep Learning ####################
mDL <- h2o.deeplearning(1:4, 5, train)
mDL
p <- h2o.predict(mDL, test)
p
h2o.performance(mDL, test)

# Auto ML Feature ###################
nrow(train)
nrow(test)
mA <- h2o.automl(1:4, 5, train,
                 max_runtime_secs = 30)
mA
mA@leaderboard
p <- h2o.predict(mA@leader, test)
p
h2o.performance(mA@leader, test)
