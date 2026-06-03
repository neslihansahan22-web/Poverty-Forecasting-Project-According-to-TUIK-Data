
#Method için 
autoplot(poverty_rate_re)+
  autolayer(naive_forecast)

## Moving Avarage 
ma3 <- stats::filter(
  poverty_rate_re,
  rep(1/3,3),
  sides=1
)
wma <- TTR::WMA(
  poverty_rate_re,
  n=3,
  wts=c(0.2,0.3,0.5)
#A 3-period moving average was selected because the annual series contains only twenty observations.
  
# Simple Exponential Smoothing
  ses_model <- ses(
    poverty_rate_re,
    h=1
  )
  ses_model$model$par

# Trend Adjusted ES
  holt_model <- holt(
    poverty_rate_re,
    h=1
  )
  holt_model$model$par

  