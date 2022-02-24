##### Question 1 ----
# Make a graph that communicates about emissions from any countries of your 
# choice. Explain how you considered principles of visualization in making your 
# graph.

Emissions_countries <- datCO2[datCO2$Entity == "United States" |
                         datCO2$Entity == "China" |
                         datCO2$Entity == "Brazil" , ]


ggplot(data = Emissions_countries,
       aes(x = Year, y=CO2, color=Entity) ) +
  geom_point() +
  geom_line() +
  labs(x = "Year", y = "Country fossil fuel emissions (tons CO2)", 
       title = "Change in fossil fuel emissions in Brazil, China, 
       United States from 1750-Present") +
  theme_classic() +
  scale_color_manual(values = c("#008000", "#FF00007D", "#0000FF7D")) 

co2_emissions <- ggplot(data = Emissions_countries,
                        aes(x = Year, y=CO2, color=Entity) ) +
  geom_point() +
  geom_line() +
  labs(x = "Year", y = "Country fossil fuel emissions (tons CO2)", 
       title = "Change in fossil fuel emissions in Brazil, China, 
       United States from 1750-Present") +
  theme_classic() +
  scale_color_manual(values = c("#008000", "#FF00007D", "#0000FF7D")) 
  
co2_emissions + annotate("segment",
                         x = 1958,
                         y = 0,
                         xend = 1960,
                         yend = 6e+09) +
  annotate("text",
           x = 1945,
           y = 6.3e+09,
           label = "great leap forward")

mycol2 <- rgb(255, 0, 0, max = 255, alpha = 125, names = "red50")


##### Question 2 ----
# You are tasked with communicating the change in world air temperatures and CO2 
# emissions to a broad audience in visually appealing graphs. Make two graphs to 
# present in your word document side by side. Plot world CO2 emissions on one 
# graph and world air temperature anomalies on the other graph.

ggplot(data = climate_change[climate_change$Entity != "World",],
       aes(x = Date, y = temperature_anomaly, color = Entity)) +
  geom_point() +
  geom_line() +
  facet_grid(. ~ Entity) +
  labs(x="Years", y="Temperature Anomalies", title = "Temperature Anomalies in Northern and Southern 
  Hemispheres from 1900-Present") +
  theme_classic() +
  scale_color_manual(values = c("#E7B80055","#34495E55"))

ggplot(data = datCO2[datCO2$Entity == "World",], 
       aes(x = Year, y=CO2, color=Entity ) ) + 
  geom_point()+ 
  geom_line()+ 
  labs(x="Year", y="World fossil fuel emissions (tons CO2)", title = "Change in Carbon Dioxide Emissions Throughout the World")+ 
  theme_classic() +
  scale_color_manual(values = c("#0000FF7D")) 

World_CO2_Emissions <- ggplot(data = datCO2[datCO2$Entity == "World",], 
                              aes(x = Year, y=CO2, color=Entity ) ) + 
  geom_point()+ 
  geom_line()+ 
  labs(x="Year", y="World fossil fuel emissions (tons CO2)", title = "Change in Carbon Dioxide Emissions Throughout the World")+ 
  theme_classic() +
  scale_color_manual(values = c("#0000FF7D")) 

World_CO2_Emissions + annotate("segment",
                         x = 1900,
                         y = 0,
                         xend = 1900,
                         yend = 1e+10) +
  annotate("text",
           x = 1885,
           y = 1.5e+10,
           label = "Start of temperature 
           anomalies measurements")

##### Question 3 ----
# Look up any time of environmental data of your interest in our world in data. 
# Download the csv and upload it to RStudio Cloud. Remake the graph. 
# You may make the graph exactly as it is or alter it to present the data in a 
# different format. Explain how you considered principles of visualization in 
# making your graph. Explain the main conclusion of the graph.

coal_emissions <- read.csv(file = "cumulative-co2-coal.csv")

colnames(coal_emissions)
colnames(coal_emissions)[4] <- "Coal.Emissions"  
colnames(coal_emissions)  

coal_countries <- coal_emissions[coal_emissions$Entity == "United States" |
                                coal_emissions$Entity == "China" |
                                coal_emissions$Entity == "Germany" |
                                  coal_emissions$Entity == "United Kingdom" |
                                  coal_emissions$Entity == "India" |
                                  coal_emissions$Entity == "South Africa" |
                                  coal_emissions$Entity == "Australia" ,]
ggplot(data = coal_countries,
       aes(x = Year, y = Coal.Emissions, color=Entity) ) +
  geom_point() +
  geom_line() +
  labs(x = "Year", y = "Coal Emissions by Country (tons CO2)",
       title = "Change in Coal Emissions from 1750-Present Day") +
  theme_classic()  +
  scale_color_manual(values = c("#800080", "#FF0000", "#000000", "#FFA500", 
                                "#FFFF00", "#87CEEB", "#0000CD")) 
