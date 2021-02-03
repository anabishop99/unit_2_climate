## CO2 Mauna Loa

url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
co2 = read.table(url, col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonalized", "n_days", "st_dev_days", "monthly_mean_uncertainty"))
head(co2)
