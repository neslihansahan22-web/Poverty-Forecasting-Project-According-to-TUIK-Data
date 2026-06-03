library(ggplot2)
library(forecast)

# --- MODEL VE TAHMİN HAZIRLIKLARI ---

# 1. Naive Model
naive_model <- naive(poverty_rate_re, h = 1)
naive_fit   <- fitted(naive_model)

# 2. Moving Average (3-Period MA)
ma3 <- stats::filter(poverty_rate_re, rep(1/3, 3), sides = 1)

# 3. Weighted Moving Average (WMA)
# (TTR::WMA çıktı uzunluğunu korumak için başına NA ekler, ts nesnesine geri çeviriyoruz)
wma_values <- TTR::WMA(as.numeric(poverty_rate_re), n = 3, wts = c(0.2, 0.3, 0.5))
wma3       <- ts(wma_values, start = start(poverty_rate_re), frequency = frequency(poverty_rate_re))

# 4. Simple Exponential Smoothing (SES)
ses_model <- ses(poverty_rate_re, h = 1)
ses_fit   <- fitted(ses_model)

# 5. Trend-Adjusted Exponential Smoothing (Holt's Linear)
holt_model <- holt(poverty_rate_re, h = 1)
holt_fit   <- fitted(holt_model)

# 6. Linear Trend Projection
# (Eksik olan trend modelinizi zaman indeksine göre kuruyoruz)
year_index  <- 1:length(poverty_rate_re)
trend_model <- lm(poverty_rate_re ~ year_index)
trend_fit   <- ts(predict(trend_model), start = start(poverty_rate_re), frequency = frequency(poverty_rate_re))

# 7. Superior Method (Trend Model) & Next-Period Forecast (2026)
new_year      <- length(poverty_rate_re) + 1
forecast_2026 <- as.numeric(predict(trend_model, newdata = data.frame(year_index = new_year)))
trend_fore    <- rlang::duplicate(trend_fit) # Yapıyı korumak için kopyala
# 2026 tahmini için uzatılmış ts nesnesi
poverty_with_fore <- ts(c(as.numeric(poverty_rate_re), forecast_2026), start = 2006, frequency = 1)
trend_with_fore   <- ts(c(as.numeric(trend_fit), forecast_2026), start = 2006, frequency = 1)


#

# Plot 1: Actual time series plot
autoplot(poverty_rate_re) +
  labs(title = "1. Actual Time Series", x = "Year", y = "%") +
  theme_minimal()

# Plot 2: Actual vs Naïve Forecast plot
autoplot(poverty_rate_re, series = "Actual") +
  autolayer(naive_fit, series = "Naïve Forecast") +
  labs(title = "2. Actual vs Naïve Forecast", x = "Year", y = "%") +
  theme_minimal()

# Plot 3: Actual vs Moving Average plot
autoplot(poverty_rate_re, series = "Actual") +
  autolayer(ma3, series = "3-Period MA") +
  labs(title = "3. Actual vs Moving Average", x = "Year", y = "%") +
  theme_minimal()

# Plot 4: Actual vs Weighted Moving Average plot
autoplot(poverty_rate_re, series = "Actual") +
  autolayer(wma3, series = "Weighted MA") +
  labs(title = "4. Actual vs Weighted Moving Average", x = "Year", y = "%") +
  theme_minimal()

# Plot 5: Actual vs Exponential Smoothing plot
autoplot(poverty_rate_re, series = "Actual") +
  autolayer(ses_fit, series = "SES Fitted") +
  labs(title = "5. Actual vs Simple Exponential Smoothing", x = "Year", y = "%") +
  theme_minimal()

# Plot 6: Actual vs Trend-Adjusted Exponential Smoothing plot
autoplot(poverty_rate_re, series = "Actual") +
  autolayer(holt_fit, series = "Holt's Linear Trend") +
  labs(title = "6. Actual vs Trend-Adjusted Exponential Smoothing", x = "Year", y = "%") +
  theme_minimal()

# Plot 7: Actual vs Linear Trend Projection plot
autoplot(poverty_rate_re, series = "Actual") +
  autolayer(trend_fit, series = "Linear Trend") +
  labs(title = "7. Actual vs Linear Trend Projection", x = "Year", y = "%") +
  theme_minimal()

# Plot 8, 9, 10, 11: NOT APPLICABLE (Annual Data Limitation Notes)
# Data is annual (frequency = 1). Seasonal indices, decomposition , and seasonal dummy regressions cannot be constructed.

# Plot 12: Final plot showing the superior method and the next-period forecast
autoplot(poverty_with_fore, series = "Actual / Target (2026)") +
  autolayer(trend_with_fore, series = "Superior Method: Trend Model") +
  geom_point(aes(x = 2026, y = forecast_2026), color = "red", size = 3) +
  labs(title = "12. Superior Method (Trend Model) and Next-Period Forecast (2026)", x = "Year", y = "%") +
  theme_minimal()
