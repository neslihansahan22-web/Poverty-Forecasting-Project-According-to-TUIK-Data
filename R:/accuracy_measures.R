# 1. Eksik olan 'outputs/tables' klasörünü bilgisayarında oluşturur
dir.create("outputs/tables", recursive = TRUE, showWarnings = FALSE)
# 2. Tabloyu CSV olarak o klasörün içine kaydeder
write.csv(accuracy_table, "outputs/tables/accuracy_comparison.csv", row.names = FALSE)
# 1. Klasörü oluştur
dir.create("outputs/tables", recursive = TRUE, showWarnings = FALSE)
# 2. Naive ve Trend modelleri için gerçek verileri ve tahminleri eşitle
# (Uzunlukların çakışmaması için Naive modelde ilk gözlemi eliyoruz)
gercek_naive  <- as.numeric(poverty_rate_re[-1])
tahmin_naive  <- as.numeric(naive_forecast[-1])
gercek_trend  <- as.numeric(poverty_rate_re)
tahmin_trend  <- as.numeric(trend_model$fitted.values)
# 3. Metrikleri hesaplayan yardımcı bir fonksiyon tanımlayalım
hesapla_metrikler <- function(actual, forecast) {
  errors <- actual - forecast
  n <- length(errors)
  bias <- mean(errors)
  mad  <- mean(abs(errors))
  mse  <- mean(errors^2)
  mape <- mean(abs(errors) / actual) * 100
  rsfe <- sum(errors)
  ts   <- rsfe / mad
  return(c(Bias=bias, MAD=mad, MSE=mse, MAPE=mape, RSFE=rsfe, Tracking_Signal=ts))
}
# 4. İki model için de metrikleri çalıştır
metrics_naive <- hesapla_metrikler(gercek_naive, tahmin_naive)
metrics_trend <- hesapla_metrikler(gercek_trend, tahmin_trend)
# 5.tabloyu oluştur
accuracy_table <- data.frame(
  Method          = c("Naive Model", "Trend Model"),
  Bias            = c(metrics_naive["Bias"], metrics_trend["Bias"]),
  MAD             = c(metrics_naive["MAD"], metrics_trend["MAD"]),
  MSE             = c(metrics_naive["MSE"], metrics_trend["MSE"]),
  MAPE            = c(metrics_naive["MAPE"], metrics_trend["MAPE"]),
  RSFE            = c(metrics_naive["RSFE"], metrics_trend["RSFE"]),
  Tracking_Signal = c(metrics_naive["Tracking_Signal"], metrics_trend["Tracking_Signal"])
)
# 6. Tabloyu CSV olarak dışa aktar
write.csv(accuracy_table, "outputs/tables/accuracy_comparison.csv", row.names = FALSE)
# Tabloyu ekranda göster
print(accuracy_table)
View(accuracy_table)

