library(tidyverse)
library(readr)
Other_KPIs <- read_csv("Shell Other KPI.csv")

#1. Fresh Water Withdrawn vs Fresh Water used vs Fresh Water Returned 
DF1 <- Other_KPIs %>% select(Year, `Fresh Water Withdrawn (MCM)`, `Fresh Water Used (MCM)`, `Fresh Water Returned (MCM)`)
DF1_long <- pivot_longer(DF1, -Year, names_to = "Category", values_to = "Volume/1^3 Tonnes")
Water_P1 <- ggplot(DF1_long, aes(x = Year, y = `Volume/1^3 Tonnes`, colour = Category)) +
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "Fresh Water") +
  theme_minimal()
print(Water_P1)
ggsave("Fresh_Water.png", scope2_p1, width = 10, height = 6)

#2. Total Waste Disposed vs Hazardous Waste Disposed vs Waste Recycled 
DF2 <- Other_KPIs %>% select(Year, `Waste Disposed (1^3 Tonnes)`, `Hazardous Waste (1^3 Tonnes)`, `Waste recycled (1^3 Tonnes)`)
DF2_long <- pivot_longer(DF2, -Year, names_to = "Key", values_to = "Mass/1^3 Tonnes")
WasteP1 <- ggplot(DF2_long, aes(x = Year, y = `Mass/1^3 Tonnes`, colour = Key)) +
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "Waste Comparison") +
  theme_minimal()
print(WasteP1)
ggsave("Waste_Comparison.png", WasteP1, width = 10, height = 6)

#3. Spill vs Spill Volume 
rm(DF3, DF3_long) #deleted variables 
DF3_Spills <- Other_KPIs %>% select(Year, Spills)
Spills <- ggplot(DF3_Spills, aes(x = Year, y = Spills)) + 
  geom_col(fill = "darkorange", alpha = 0.8, width = 0.7) +
  labs(title = "Shell Oil Spills Count YoY", y = "Number of Spills", x = "Year") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1))
ggsave("Shell_Oil_Spills_Count.png", Spills, height = 10, width = 6, dpi = 300)

#4.0 Spills Volume YoY
Spills_Vol <- ggplot(Other_KPIs, aes(x = Year, y = `Spill volume (1^3 Tonnes)`)) +
  geom_line(color = "red", size = 1.2) +
  geom_point(color = "red", size = 3) +
  labs(title = "Shell Spill Volume YoY", y = "Volume (1^3 tonnes)", x = "Year") +
  theme_minimal()
print(Spills_Vol)
ggsave("Spill_Vol_YoY.png", Spills_Vol, height = 10, width = 6, dpi = 300)
