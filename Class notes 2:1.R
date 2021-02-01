#in class lesson 1
# ice sheets
#2/1/2021

#read in data

ant_ice_loss = read.table('data/antarctica_mass_200204_202008.txt', 
           skip=31, col.names = c("decimal_date", "mass_Gt", "sigmas_Gt"))
grn_ice_loss = read.table('data/greenland_mass_200204_202008.txt', 
           skip=31, col.names = c("decimal_date", "mass_Gt", "sigmas_Gt"))
summary(ant_ice_loss)
dim(grn_ice_loss)           
#plot
#x,y
#x~y
range(grn_ice_loss$mass_Gt)
lines(mass_Gt ~ decimal_date, data = ant_ice_loss, ylab = "Mass loss (Gt)", ylim=range(grn_ice_loss$mass_Gt), type ="l")
lines(mass_Gt ~ decimal_date, data = grn_ice_loss, col = "red", ylab="Mass loss (Gt)")

#insert a break into the data 2017-2018

tail(ant_ice_loss)
data_break = data.frame(decimal_date = 2018, mass_Gt=NA, sigmas_Gt=NA)
data_break

grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break)
tail(ant_ice_loss_with_NA)

# sort data with NA
order(ant_ice_loss_with_NA$decimal_date)
grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),]

plot(mass_Gt~decimal_date, data = ant_ice_loss_with_NA,ylab = "Mass loss (Gt)", ylim = range(grn_ice_loss$mass_Gt), type="l")
lines(mass_Gt~decimal_date, data = grn_ice_loss_with_NA, ylab = "Mass loss (Gt)", col="red")

head(ant_ice_loss_with_NA)

#plot with uncertainty

#save the plot
pdf('figures/ice_mass_trends.pdf', width=7, height=5)  # opens PDF device

plot(mass_Gt~decimal_date, data = ant_ice_loss_with_NA,ylab = "Mass loss (Gt)", ylim = range(grn_ice_loss$mass_Gt), type="l")
#add uncertainty to antarctica
lines((mass_Gt + 2*sigmas_Gt)~decimal_date, data = ant_ice_loss_with_NA, ylab = "Mass loss (Gt)", lty="dashed")
lines((mass_Gt + 2*sigmas_Gt)~decimal_date, data = ant_ice_loss_with_NA, ylab = "Mass loss (Gt)", lty="dashed")

#add greenland
lines(mass_Gt~decimal_date, data = grn_ice_loss_with_NA, ylab = "Mass loss (Gt)", col="red")
lines((mass_Gt + 2*sigmas_Gt)~decimal_date, data = grn_ice_loss_with_NA, ylab = "Mass loss (Gt)", lty="dashed", col = "red")
lines((mass_Gt + 2*sigmas_Gt)~decimal_date, data = grn_ice_loss_with_NA, ylab = "Mass loss (Gt)", lty="dashed", col = "red")

dev.off()  #turns off PDF device

##Bar plots

min(ant_ice_loss$mass_Gt)
min(grn_ice_loss$mass_Gt)

barplot(height = c(-1*min(ant_ice_loss$mass_Gt), -1*min(grn_ice_loss$mass_Gt)), names.arg = c("Antarctica", "Greenland"), ylim = c(0,5000))
summary(ant_ice_loss$decimal_date)

pdf('figures/ice_mass_rate.pdf', width=7, height=5)
#fix this
barplot(height = c(-1*((min(ant_ice_loss$mass_Gt)/20)), -1*min((grn_ice_loss$mass_Gt)/20)), names.arg = c("Antarctica", "Greenland"), ylim = c(0,300))
dev.off()
