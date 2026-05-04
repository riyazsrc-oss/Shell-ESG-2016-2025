library(tidyverse)
library(dplyr)
library(readr)
library(lubridate)

Data_Frame <- read.csv("G KPIs.csv")
rm(cf)
df_filtered <- Data_Frame %>%
  filter(between(Year, 2020, 2025))
Capex <- ggplot(df_filtered, aes(x = Year, y = Low.Carbon.Capex....Billion)) +
  geom_line(color = "darkred", size = 1.2) +
  geom_point(size = 3, color = "darkred") +
  labs(title = "Shell YoY Low Carbon Capex", y = "Low carbon Capex $Billion", x = "Year") +
  theme_minimal()
print(Capex)
ggsave("YoY_Capex.png",Capex, width = 10, height = 6) #save fucntion 

Pay_Ratio <- ggplot(df_filtered, aes(x = Year, y = CEO.Median.Pay.Ratio.x.1)) +
  geom_line(color = "darkred", size = 1.2) +
  scale_y_continuous(breaks = seq(floor(min(df_filtered$Low.Carbon.Capex....Billion)),
                                  ceiling(max(df_filtered$Low.Carbon.Capex....Billion)),
                                  by = 2) +
                       geom_point(size = 3, color = "darkred") +
                       labs(title = "Shell CEO:Median Employee Pay Ratio", y = "Pay Ratio", x = "Year") +
                       theme_minimal()
print(Pay_Ratio)
ggsave("CEO_Employee_Pay_Ratio.png", height = 6, width = 10, dpi = 300)

          

