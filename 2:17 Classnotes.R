avg = function(x){
  s = sum(x)
  n = length(x)
  result2 = return(s/n)
}
  
data = c(2,4,6,8)
avg(data)
mean(data)

#if parameter arithmetic = TRUE, return arithmetic mean
#if arithmetic = FALSE, return geometric mean
avg = function(x, arithmetic = TRUE){  #x parameter is the data
  n = length(x)
  result = ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
  return(result)
}

data = c(1,3,5,7)
avg(data)
avg(data, arithmetic = FALSE)
avg(arithmetic=TRUE)
avg(data, TRUE)

avg = function(x, arithmetic = TRUE){  #x parameter is the data
  if(!is.numeric(x)){stop("Error: function failed. x must be numeric")}
  n = length(x)
  result = ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
  return(result)
}

avg(TRUE, data)

#turning grade percentage into letter grade
grade = function(x){
  if(x>90 & x<100) {print("A")}
    else if (x>80 & x<89.9) {print("B")}
    else if (x>70 & x<79.9) {print("C")}
   else if (x>60 & x<69.9) {print("D")}
    else if (x>50 & x<59.9) {print("F")}
    else if (x>0 & x<49.9) {print("You failed")}
}

##Global mean temperature data

url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'
temp_anomaly = read.delim(url, skip=5, sep="", header=FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))
head(temp_anomaly)  
summary(temp_anomaly)

plot(No_Smoothing ~ Year, data=temp_anomaly, type = "b") #b is both points and lines
lines(Lowess_5 ~ Year, data=temp_anomaly, col="red")
abline(v=2012,lty="dashed")
abline(v=1998, lty="dashed")
lines(y=c(temp_1998, temp_2012), x=c(1998, 2012), col="blue")

temp_1998 = temp_anomaly$No_Smoothing[which(temp_anomaly$Year == 1998)]
temp_1998
temp_2012 = temp_anomaly$No_Smoothing[which(temp_anomaly$Year == 2012)]
temp_2012  

#calculate rolling averages
roll_avg = temp_anomaly
roll_avg$year5 = NA
roll_avg$year10 = NA

dim(roll_avg)[1]
for(i in seq(dim(roll_avg)[1])){
  #calculate the 5 year rolling averages
  if(i>=5){
  roll_avg$year5[i] = mean(roll_avg$No_Smoothing[c((i-4):i)])
  }
  if(i>=10){
    roll_avg$year10[i] = mean(roll_avg$No_Smoothing[c((i-9):i)])
  }
}
head(roll_avg)
tail(roll_avg)  

#plot it
pdf('figures/global_mean_temp_rolling_averages.pdf', width=7, height=5)
plot(No_Smoothing ~ Year, data=roll_avg, type = "b")
lines(year5 ~ Year, data=roll_avg, col="red")
lines(year10 ~ Year, data=roll_avg, col="blue")
dev.off()

#class exercise - it's wrong
calc_rolling_avg = function(data, num_years=5){
 data$roll_avg = NA
 for(i in seq(dim(data)[1]))
 {
   if(i >= num_years & i <= (dim(data)[1])){
     data$roll_avg[i] = mean(data[c((i-(num_years-1)):i, 'No_Smoothing'])
   }
 }
 
 
x(1998)


  