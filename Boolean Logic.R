# boolean logic and if/else statements

world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
## < <= > >= == != %in%

world_oceans$avg_depth_m > 4000

world_oceans[ world_oceans$avg_depth_m > 4000,]

sum(world_oceans$avg_depth_m > 4000)

world_oceans$ocean[ world_oceans$avg_depth_m > 4000]

visits = c("Atlantic")
visits_info = world_oceans[ world_oceans$ocean %in% visits,]
visits_info

## precision

x = 5
y = 5
x==5

1+2 == 3
0.1 + 0.2 == 0.3

error_threshold = 0.0000001
abs(0.1 + 0.2) - 0.3 < error_threshold

x = 10
y = 5
z = 2

x < y | y > z
a = c(TRUE, FALSE, TRUE)
any(a)
all(a)

NA == NA
is.na(NA)
data = c(1,2,3,NA,4)
data == NA
is.na(data)

any(is.na(data))

num = -2
if(num < 0){
  num = num*-1
}
num

num = 8

temp = c(98.4, 99.5, 102.1)
if (any(temp >98.6)){
  count = temp-98.6
  print(count)
  if (any(temp > 101)){
    print("warning")
  }
}

score_1 = 35
score_2 = 35
if (score_1 > score_2){
  print("1 wins!")
} else if (score_2 > score_1){
  print("2 wins!")
} else {
  print("they tied")
}

a = 0
ifelse(a > 0, 1/a, NA)
# ifelse (condition, if true do this, if false do this)
