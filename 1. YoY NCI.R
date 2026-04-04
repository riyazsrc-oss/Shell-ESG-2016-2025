# YoY Overall Net Carbon Intensity 
library(tidyverse)
library(readr)
Shell_Scope_1 <- read_csv("Shell Scope 1.csv")
view(Shell_Scope_1)

Shell_Scope_1[,2]

### Plot 1 YoY NCI 

library(ggplot2)
library(dplyr)

P1 <- ggplot(Shell_Scope_1, aes(x = Year, y = `NCI (gCO2e/MJ)`)) + #ggplot function to intiate graph
  geom_line(color = "darkred", size = 1.2) + #geom_line and color (specified) with size 
  geom_point(size = 3, color = "darkred") + #geompoint adding the dots 
  labs(title = "Shell NCI YoY", y = "NCI (gCO2/MJ)", x = "Year") + #labs and title for graph
  theme_minimal() #theme
print(P1)
ggsave("nci.yoy.png", P1, width = 10, height = 6) #save fucntion 