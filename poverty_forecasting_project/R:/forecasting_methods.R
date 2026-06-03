#Naive ve Trend modellerini kur 

naive_model1 <- naive(poverty_rate_re)
naive_forecast <- fitted(naive_model)
naive_accuracy <- accuracy_metrics(
  poverty_rate_re[-1],
  naive_forecast[-1]
)

autoplot(poverty_rate_re)+
  autolayer(naive_forecast)
