# for loops refresher

vec = c(1,3,5,7,9)
total = 0

for(i in seq(length(vec))){
  total = total + vec[i]
  print(total)
}
total
sum(vec)
vec^2

n = c(3)
n = 5

for(i in seq(length(n))){
  f = factorial(n)
  print(f)
}

mat = matrix(c(2,0,8,3,5,-4), nrow=2, ncol = 3)
results = matrix(data=NA, nrow=2, ncol=3)

for (i in c(1:2)){
  for(j in c(1:3)){
    results[i,j] = mat[i,j]^2
    print(paste("row: ",i, " and column:",j))
  }
}

# while loops

num = -3
while(num < 0){
  num = num+1
  print(num)
}

## sea ice 

url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url,skip=2, sep=",", header=FALSE, 
                        col.names=c("Year", "Month", "Day", "Extent", "Missing", "Source Data"))

head(arctic_ice)
summary(arctic_ice)  
library("lubridate") #handles date issues 

arctic_ice$date = make_date(year = arctic_ice$Year, month=arctic_ice$Month, day=arctic_ice$Day)
head(arctic_ice)
summary(arctic_ice)

#plot

plot(Extent~date, data=arctic_ice, type='l')

#calculate averages

#annual avg
arctic_ice_annual = data.frame(Year=c(1978:2021), extent_annual_average=NA, extent_5yr_average=NA)
arctic_ice_annual$extent_annual_avg[1] = mean(arctic_ice$Extent[which(arctic_ice$Year == 1978)])

for (i in seq(dim(arctic_ice_annual)[1]-1)){
  arctic_ice_annual$extent_annual_avg[i] = mean(arctic_ice$Extent[which(arctic_ice$Year == arctic_ice_annual$Year[i])])
}

plot(extent_annual_avg ~ Year, data = arctic_ice_annual, type = "l")

#5 year rolling average
for (i in seq(dim(arctic_ice_annual)[1]-1)){
  years = c(arctic_ice_annual$Year[i]-2, arctic_ice_annual$Year[i]+2)
  arctic_ice_annual$extent_5yr_avg[i] = mean(arctic_ice$Extent[which(arctic_ice$Year %in% years)])
}
arctic_ice_annual
plot(extent_5yr_avg ~ Year, data = arctic_ice_annual, type = "l")

