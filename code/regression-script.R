# Build the model
setwd("~/Desktop/Fall_2016/Stat159/stat159-fall2016-hw02")
advertising = read.csv('data/Advertising.csv')
fit = lm(advertising$Sales~advertising$TV, data = advertising)
modelInfo = summary(fit)
# Extract the coefficients
intercept = modelInfo$coefficients[1]
slope = modelInfo$coefficients[2]

# Output the object
sink('data/regression-script.R')
fit
sink()

# Output the graph
pdf('images/scatterplot-tv-sales.pdf')
plot(x = advertising$TV, y = advertising$Sales, main = 'Regression', xlab = 'TV', ylab = 'Sales')
abline(a = intercept, b = slope, col = 'red')
dev.off()

png('images/scatterplot-tv-sales.png')
plot(x = advertising$TV, y = advertising$Sales, main = 'Regression', xlab = 'TV', ylab = 'Sales')
abline(a = intercept, b = slope, col = 'red')
dev.off()
