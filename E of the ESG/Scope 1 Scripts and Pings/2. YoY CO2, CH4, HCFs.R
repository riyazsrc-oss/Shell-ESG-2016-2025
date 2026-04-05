# YoY Gas Emissions (Scope 1)
library(dplyr)
library(ggplot2)
gases <- Shell_Scope_1 %>% select(Year, `CO2 (1^6 Tonnes)`, `CH4  (1^3 Tonnes)`, `HCF's (1^3 Tonnes)`)
gases_long <- pivot_longer(gases, -Year, names_to = "Gas", values_to = "value")

p2 <- ggplot(gases_long, aes(x = Year, y = value, colour = Gas)) +
  geom_line(size = 1) + geom_point(size = 2.5) +
  labs(title = "Shell Scope 1 YoY Gases", y = "Emissions", x = "Year") +
  theme_minimal()
print(p2)
ggsave("gases_yoy.png", p2, width=10, height=6)
