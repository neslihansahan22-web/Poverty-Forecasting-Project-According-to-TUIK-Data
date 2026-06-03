# 1. renv paketini yükle ve aktif et
install.packages("renv")
library(renv)

# 2. Projenin bağımlılıklarını analiz et ve altyapıyı kur
renv::init()

# 3. Kodlarında kullandığın tüm paketleri kilitle ve renv.lock dosyasını diske yaz
renv::snapshot(prompt = FALSE)
