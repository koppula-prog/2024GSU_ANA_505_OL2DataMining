install.packages('caTools')
library(caTools)

#Y:Salary
#X:Years_experienced

# Creating the data set for the given data
Years_Exp = c(1.1, 1.3, 1.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7)
Salary = c(39343, 46205, 37731, 43525, 39891, 56642, 60150, 54445, 64445, 57189)

# Creating a df for the above data
salary_data <- data.frame(Years_Exp, Salary)

print(salary_data)

# Setting seed to reproduce the results
set.seed(123)


#Splitting the data into training and test sets
split_data <- sample.split(salary_data$Salary, SplitRatio = 0.7)
trainingset <- subset(salary_data, split_data == TRUE)
testset <- subset(salary_data, split_data == FALSE)


print(trainingset)
print(testset)


# Simple linear regression model for training set
lm.r <- lm(formula = Salary ~ Years_Exp, data = trainingset)

#

# Summary of the linear regression model
summary(lm.r)


# plot(trainingset$Years_Exp, trainingset$Salary, 
#      main = "trainingset:salary vs years experienced",
#      xlab = "years experienced", ylab = "Salary", 
#      pch = 16, col = "blue")
# abline(lm.r, col = "red")


# Predicting the salary for the test set with the liner regression model
y_test <- predict(lm.r, newdata = testset)


# plot(testset$Years_Exp, testset$Salary, 
#      main = "testset:salary vs years experienced",
#      xlab = "years experienced", ylab = "Salary", 
#      pch = 16, col = "blue")
# abline(lm.r, col = "red")

#predicted values
print(y_test)

#actual values from the data set
print(testset)

