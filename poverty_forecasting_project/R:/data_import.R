# TÜİK oturumu oluştur
> session <- httr::handle("https://veriportali.tuik.gov.tr")
GET(
  "https://veriportali.tuik.gov.tr",
  handle = session
)

> tables_7 <- statistical_tables("7")
tables_7 %>%
  select(table_name, table_url) %>%
  print(n = Inf)
poverty_table <- tables_7 %>%
  filter(node_type == "istab") %>%
  filter(
    grepl(
      "Poverty and Living Conditions",
      table_name,
      ignore.case = TRUE
    )
  )

# ÖNEMLİ: Önce ana sayfayı ziyaret et, yoksa Access Denied verir
> session <- httr::handle("https://veriportali.tuik.gov.tr")
GET("https://veriportali.tuik.gov.tr", handle = session)
# Dosyayı indir
>tmp <- tempfile(fileext = ".xls")
GET(
  url,
  handle = session,
  write_disk(tmp, overwrite = TRUE),
  add_headers(
    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    "Referer" = "https://veriportali.tuik.gov.tr"
  )
)

# Verileri okuma 
> url <- tables_7 %>%
  +     filter(!is.na(table_url)) %>%
  +     slice(183) %>%
  +     pull(url)
library(httr)
)
table_statistics <- read_xls(tmp)
names(table_statistics)
summary(table_statistics)
colSums(is.na(table_statistics))
str(table_statistics)

print(table_statistics)
head(table_statistics)

Eşdeğer hanehalkı kullanılabilir fert gelirine göre hesaplanan yoksul sayıları, yoksulluk oranı ve yoksulluk açığı, 2006-2025
1                                                                                                                          Number of the poor, poverty rate and poverty gap by equivalised household disposable income, 2006-2025
2                                                                                                                                                                                                                            <NA>
  3                                                                                                                                                                                                                            <NA>
  4                                                                                                                                                                          Medyan gelirin %40'ına göre \n40% of the median income
5                                                                                                                                                                          Yoksulluk sınırı (TL)         \nPoverty threshold (TL)
6                                                                                                                                                         Yoksul sayısı (Bin kişi)            \nNumber of poors (Thousand person)
7                                                                                                                                                                                           Yoksulluk oranı (%)\nPoverty rate (%)
8                                                                                                                                                                                      Yoksulluk açığı(1)        \nPoverty gap(1)
9                                                                                                                                                                         Medyan gelirin %50'sine göre \n50% of the median income
10                                                                                                                                                                         Yoksulluk sınırı (TL)         \nPoverty threshold (TL)
11                                                                                                                                                        Yoksul sayısı (Bin kişi)            \nNumber of poors (Thousand person)
12                                                                                                                                                                                         Yoksulluk oranı (%) \nPoverty rate (%)
13                                                                                                                                                                                     Yoksulluk açığı(1)        \nPoverty gap(1)
14                                                                                                                                                                         Medyan gelirin %60'ına göre \n60% of the median income
15                                                                                                                                                                         Yoksulluk sınırı (TL)         \nPoverty threshold (TL)
16                                                                                                                                                        Yoksul sayısı (Bin kişi)            \nNumber of poors (Thousand person)
17                                                                                                                                                                                         Yoksulluk oranı (%) \nPoverty rate (%)
18                                                                                                                                                                                     Yoksulluk açığı(1)        \nPoverty gap(1)
19                                                                                                                                                                         Medyan gelirin %70'ine göre \n70% of the median income
20                                                                                                                                                                       Yoksulluk sınırı (TL)           \nPoverty threshold (TL)
21                                                                                                                                                        Yoksul sayısı (Bin kişi)            \nNumber of poors (Thousand person)
22                                                                                                                                                                                          Yoksulluk oranı (%)\nPoverty rate (%)
23                                                                                                                                                                                     Yoksulluk açığı(1)        \nPoverty gap(1)
24                                                                                                                                                                                     TÜİK, Gelir ve Yaşam Koşulları Araştırması
25                                                                                                                                                                                  TurkStat, Income and Living Conditions Survey
26                                                                                                                                                                               Gelir referans dönemi bir önceki takvim yılıdır.
27                                                                                                                                                                      Reference period of income is the previous calendar year.
28 (1) Yoksulluk açığı, yoksulluğun derecesi hakkında bilgi verir. Yoksulluk açığının 100'e yaklaşması, yoksulluğun derecesinin çok fazla olduğunu, küçülmesi ise yoksulluk risk derecelerinin daha az olduğunu ifade etmektedir.
29                                                                                                       Yoksulluk açığı = ((Yoksulluk sınırı-Yoksulların EFB medyan geliri)/Yoksulluk sınırı)*100 formülüne göre hesaplanmıştır.
30                               (1) Poverty gap ratio informs about poverty level. It represents the severity of poverty is too much if it approaches to "100" and it represents the poverty risk degree is lower if it reduces.
31                                                                                             Poverty gap is calculated as this formula: Poverty gap = ((Poverty threshold-Median income of poors by EII)/Poverty threshold)*100
                 ...2       ...3       ...4       ...5       ...6       ...7       ...8
1                <NA>         NA         NA         NA         NA         NA         NA
2      Yıllar - Years         NA         NA         NA         NA         NA         NA
3                2006  2007.0000  2008.0000  2009.0000  2010.0000  2011.0000  2012.0000
4                <NA>         NA         NA         NA         NA         NA         NA
5  1880.6300000000001  2432.7900  2531.2800  2817.6700  2971.5500  3255.4500  3611.0000
6  8665.0200000000004  6798.5100  7020.7700  7484.8600  7355.0200  7288.1800  7344.1400
7  12.812200000000001     9.9282    10.1409    10.6105    10.3094    10.0698     9.9780
8  29.101800000000001    24.5265    23.7477    25.6464    23.9899    25.3528    23.6977
9                <NA>         NA         NA         NA         NA         NA         NA
10            2350.79  3040.9900  3164.1100  3522.0900  3714.4400  4069.3100  4515.1000
11           12548.09 11163.3300 11579.6000 12097.0600 12025.1900 11669.8900 11998.0100
12 18.553799999999999    16.3024    16.7258    17.1488    16.8555    16.1238    16.3009
13            31.6615    26.3920    25.6225    28.0250    26.6249    26.3416    26.8967
14               <NA>         NA         NA         NA         NA         NA         NA
15 2820.9499999999998  3649.1800  3796.9300  4226.5100  4457.3200  4883.1700  5418.1200
16 17164.669999999998 16053.2100 16713.6400 17122.9600 16963.4200 16569.1300 16740.8900
17 25.379999999999999    23.4433    24.1415    24.2735    23.7774    22.8929    22.7447
18 33.600000000000001    28.4003    27.9000    29.6293    28.6550    29.1979    29.2459
19               <NA>         NA         NA         NA         NA         NA         NA
20 3291.0999999999999  4257.3800  4429.7500  4930.9300  5200.2100  5697.0400  6320.0000
21           21611.25 20594.7000 21358.3900 21938.2900 21815.5000 21729.5500 22252.2200
22 31.954799999999999    30.0755    30.8504    31.0997    30.5784    30.0229    30.2326
23 34.813099999999999    31.2355    31.2719    32.3784    31.8965    31.0418    31.2442
24               <NA>         NA         NA         NA         NA         NA         NA
25               <NA>         NA         NA         NA         NA         NA         NA
26               <NA>         NA         NA         NA         NA         NA         NA
27               <NA>         NA         NA         NA         NA         NA         NA
28               <NA>         NA         NA         NA         NA         NA         NA
29               <NA>         NA         NA         NA         NA         NA         NA
30               <NA>         NA         NA         NA         NA         NA         NA
31               <NA>         NA         NA         NA         NA         NA         NA
         ...9      ...10   ...11   ...12   ...13   ...14   ...15   ...16    ...17    ...18
1          NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
2          NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
3   2013.0000  2014.0000  2015.0  2016.0  2017.0  2018.0  2019.0  2020.0  2021.00  2022.00
4          NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
5   4008.0000  4443.0200  4997.0  5693.0  6355.0  7113.0  8635.0  9915.0 11227.43 14197.33
6   6788.4500  6572.2400  6652.0  6482.0  5865.0  6322.0  6710.0  7278.0  7060.81  6353.72
7      9.1173     8.6827     8.7     8.4     7.4     7.9     8.3     8.9     8.53     7.61
8     22.6188    22.2702    22.3    20.8    20.0    22.3    21.8    23.1    24.38    22.10
9          NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
10  5007.0000  5553.7800  6246.0  7116.0  7944.0  8892.0 10793.0 12394.0 14034.29 17746.67
11 11137.1500 11331.9300 11219.0 11026.0 10622.0 11091.0 11641.0 12267.0 11935.56 12000.07
12    14.9579    14.9709    14.7    14.3    13.5    13.9    14.4    15.0    14.41    14.37
13    26.0000    24.3758    25.3    24.3    22.6    23.7    24.1    25.9    24.98    21.08
14         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
15  6012.0000  6664.5400  7495.0  8539.0  9532.0 10670.0 12952.0 14873.0 16841.14 21296.00
16 16705.5500 16501.3800 16706.0 16328.0 15864.0 16888.0 17207.0 17921.0 17636.02 18030.48
17    22.4366    21.8003    21.9    21.2    20.1    21.2    21.3    21.9    21.30    21.60
18    26.6734    27.1901    26.8    26.5    25.8    25.4    26.3    26.9    26.88    25.60
19         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
20  7016.0000  7775.2900  8744.0  9963.0 11121.0 12448.0 15111.0 17352.0 19648.00 24845.33
21 21979.1200 22223.0600 22546.0 22096.0 22171.0 22701.0 23024.0 23704.0 23789.14 24459.63
22    29.5194    29.3594    29.5    28.7    28.1    28.5    28.5    29.0    28.73    29.30
23    29.0498    29.2631    28.4    28.5    27.2    28.0    28.9    29.5    28.70    28.03
24         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
25         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
26         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
27         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
28         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
29         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
30         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
31         NA         NA      NA      NA      NA      NA      NA      NA       NA       NA
      ...19    ...20     ...21
1        NA       NA        NA
2        NA       NA        NA
3   2023.00  2024.00   2025.00
4        NA       NA        NA
5  25687.13 54494.89  96460.25
6   5857.07  5820.66   5232.91
7      6.97     6.92      6.22
8     17.63    18.77     19.51
9        NA       NA        NA
10 32108.91 68118.62 120575.32
11 11303.13 11457.40  10929.79
12    13.46    13.62     12.99
13    20.85    20.22     19.29
14       NA       NA        NA
15 38530.70 81742.34 144690.38
16 17873.39 17821.37  17360.69
17    21.28    21.18     20.63
18    23.43    24.04     22.92
19       NA       NA        NA
20 44952.48 95366.06 168805.44
21 24364.69 24318.34  24145.08
22    29.01    28.91     28.70
23    26.80    26.98     25.89
24       NA       NA        NA
25       NA       NA        NA
26       NA       NA        NA
27       NA       NA        NA
28       NA       NA        NA
29       NA       NA        NA
30       NA       NA        NA
31       NA       NA        NA
> 
> # Tablonun sadece ilk 6 satırını konsola yazdırmak için (büyük tablolar için idealdir):
> head(table_statistics)
  Eşdeğer hanehalkı kullanılabilir fert gelirine göre hesaplanan yoksul sayıları, yoksulluk oranı ve yoksulluk açığı, 2006-2025
1                        Number of the poor, poverty rate and poverty gap by equivalised household disposable income, 2006-2025
2                                                                                                                          <NA>
3                                                                                                                          <NA>
4                                                                        Medyan gelirin %40'ına göre \n40% of the median income
5                                                                        Yoksulluk sınırı (TL)         \nPoverty threshold (TL)
6                                                       Yoksul sayısı (Bin kişi)            \nNumber of poors (Thousand person)
...2    ...3    ...4    ...5    ...6    ...7    ...8    ...9   ...10 ...11
1               <NA>      NA      NA      NA      NA      NA      NA      NA      NA    NA
2     Yıllar - Years      NA      NA      NA      NA      NA      NA      NA      NA    NA
3               2006 2007.00 2008.00 2009.00 2010.00 2011.00 2012.00 2013.00 2014.00  2015
4               <NA>      NA      NA      NA      NA      NA      NA      NA      NA    NA
5 1880.6300000000001 2432.79 2531.28 2817.67 2971.55 3255.45 3611.00 4008.00 4443.02  4997
6 8665.0200000000004 6798.51 7020.77 7484.86 7355.02 7288.18 7344.14 6788.45 6572.24  6652
...12 ...13 ...14 ...15 ...16    ...17    ...18    ...19    ...20    ...21
1    NA    NA    NA    NA    NA       NA       NA       NA       NA       NA
2    NA    NA    NA    NA    NA       NA       NA       NA       NA       NA
3  2016  2017  2018  2019  2020  2021.00  2022.00  2023.00  2024.00  2025.00
4    NA    NA    NA    NA    NA       NA       NA       NA       NA       NA
5  5693  6355  7113  8635  9915 11227.43 14197.33 25687.13 54494.89 96460.25
6  6482  5865  6322  6710  7278  7060.81  6353.72  5857.07  5820.66  5232.91