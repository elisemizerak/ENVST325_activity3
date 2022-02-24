
##### Prompt 1 ----
# Make a plot of air temperature anomalies in the Northern and Southern 
# Hemisphere in base R and in ggplot2.

climate_change <- read.csv("/cloud/project/activity03/climate-change.csv")
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

climate_change$Date <- ymd(climate_change$Day)

NorthernH <- climate_change[climate_change$Entity == "Northern Hemisphere",]
plot(NorthernH$Date, NorthernH$temperature_anomaly, type = "l")
points(SouthernH$Date, SouthernH$temperature_anomaly,
       type = "l", col = "tomato3")

SouthernH <- climate_change[climate_change$Entity == "Southern Hemisphere",]


plot(climate_change$Date,
     climate_change$temperature_anomaly,
     type = "l",
     pch = 19,
     ylab = "Temperature Anomalies",
     xlab = "Date")

ggplot(data = climate_change[climate_change$Entity != "World",],
       aes(x = Date, y = temperature_anomaly, color = Entity)) +
        geom_point() +
        geom_line() +
        labs(x="Dates", y="Temperature Anomalies") +
        theme_classic()

##### Prompt 2 ----    
# Plot the total all time emissions for the United States, Mexico, and Canada.
datCO2 <- read.csv("/cloud/project/activity03/annual-co-emissions-by-region.csv")

NorthAmerica <- datCO2[datCO2$Entity == "United States" |
                         datCO2$Entity == "Canada" |
                         datCO2$Entity == "Mexico" , ]
colnames(datCO2)
colnames(datCO2)[4] <- "CO2"



ggplot(data = NorthAmerica, # data for plot
       aes(x = Year, y=CO2, color=Entity ) )+ # aes, x and y
  geom_point()+ # make points at data point
  geom_line()+ # use lines to connect data points
  labs(x="Year", y="US fossil fuel emissions (tons CO2)")+ # make axis labels
  theme_classic() +
  xaxt() = "n"




