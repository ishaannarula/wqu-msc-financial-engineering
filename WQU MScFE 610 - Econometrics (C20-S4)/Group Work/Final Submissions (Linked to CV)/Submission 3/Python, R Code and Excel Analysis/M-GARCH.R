install.packages("rugarch")
install.packages("rmgarch")

#Setting the directory to current file directory

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
daily_returns <-read.csv('log_daily_returns.csv')
library(rugarch)
library(rmgarch)
library(ggplot2)
uspec.n = multispec(replicate(2, ugarchspec(mean.model = list(armaOrder = c(1,1)))))
dcc.11mn = dccspec(uspec.n, VAR = TRUE, lag = 4, lag.max = 12, dccOrder = c(1, 1), distribution = 'mvnorm')
fit.2.11mn = dccfit(dcc.11mn, data = daily_returns [1:164, 3:4])
model <- dccforecast(fit = fit.2.11mn, n.ahead = 10, n.roll = 0)
model@mforecast$mu
