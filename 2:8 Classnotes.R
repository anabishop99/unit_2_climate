url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
co2 = read.table(url, col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonalized", "n_days", "st_dev_days", "monthly_mean_uncertainty"))
head(co2)
class(co2)
summary(co2)
range(co2$decimal_date)
range(co2$monthly_average)

##PLOT

plot(monthly_average ~ decimal_date, data=co2, type="l") +
  lines(y=co2$deseasonalized, x=co2$decimal_date, col="red")

co2$seasonal_cycle = co2$monthly_average - co2$deseasonalized
head(co2)
plot(seasonal_cycle ~ decimal_date, data =co2, type = "l")


#seasonal cycle analysis
co2[which(co2$month==1),c(3,9)]
jan_anomalies = co2$seasonal_cycle[which(co2$month==1)]
mean(jan_anomalies)

co2_monthly_cycle = data.frame(month=seq(1,12), detrended_monthly_cycle = NA)

#find mean anomalies for each month 1958-2021
co2_monthly_cycle$detrended_monthly_cycle[1] =mean(co2$seasonal_cycle[which(co2$month==1)])
co2_monthly_cycle$detrended_monthly_cycle[2] =mean(co2$seasonal_cycle[which(co2$month==2)])
co2_monthly_cycle$detrended_monthly_cycle[3] =mean(co2$seasonal_cycle[which(co2$month==3)])
co2_monthly_cycle$detrended_monthly_cycle[4] =mean(co2$seasonal_cycle[which(co2$month==4)])
co2_monthly_cycle$detrended_monthly_cycle[5] =mean(co2$seasonal_cycle[which(co2$month==5)])
co2_monthly_cycle$detrended_monthly_cycle[6] =mean(co2$seasonal_cycle[which(co2$month==6)])
co2_monthly_cycle$detrended_monthly_cycle[7] =mean(co2$seasonal_cycle[which(co2$month==7)])
co2_monthly_cycle$detrended_monthly_cycle[8] =mean(co2$seasonal_cycle[which(co2$month==8)])
co2_monthly_cycle$detrended_monthly_cycle[9] =mean(co2$seasonal_cycle[which(co2$month==9)])
co2_monthly_cycle$detrended_monthly_cycle[10] =mean(co2$seasonal_cycle[which(co2$month==10)])
co2_monthly_cycle$detrended_monthly_cycle[11] =mean(co2$seasonal_cycle[which(co2$month==11)])
co2_monthly_cycle$detrended_monthly_cycle[12] =mean(co2$seasonal_cycle[which(co2$month==12)])

co2_monthly_cycle
plot(detrended_monthly_cycle ~ month, data=co2_monthly_cycle, type = "l")
plot(seasonal_cycle ~ month, co2[co2$year==2020,], data = co2, type="l", col = "red")
tail(co2)

##loops
c(1:4)
seq(1,4)
seq(from=1, to=4)

#i is the iterand
for(i in c(1:4)){
  print(i) # one iteration
}
  
for(counter in c(1:4)){
  print(paste("my counter is", counter)) # one iteration
  counter = "pencils"
  print(counter)
}

for (value in c("My", "second", "for","loop")){
  print(value)
}

my_vector = c(1,3,5,7,9)
n = length(my_vector)
my_squared_vector = rep(NA, n)

for (i in seq(from=1, to=3)){
  my_squared_vector[i] = my_vector[i]^2
}

my_squared_vector
  
