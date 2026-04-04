# YoY Equity Boundary vs Direct Scope 1
library(dplyr)
library(ggplot2)
compare <- Shell_Scope_1 %>% select(Year, `Direct Scope 1 (MtCO2e)`, `EB (MtCO2e)`)
compare_long <- pivot_longer(compare, -Year, names_to = "Metric", values_to = "Values")

p3 <- ggplot(compare_long, aes(x = Year, y = Values, colour = Metric)) +
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "Direct Scope 1 vs EB Scope 1 YoY", y = "value", x = "Year") +
  theme_minimal()
print(p3)
ggsave("Direct_Scope_1_vs_EB_Scope_1_YoY.png", p3, width = 10, height = 6)