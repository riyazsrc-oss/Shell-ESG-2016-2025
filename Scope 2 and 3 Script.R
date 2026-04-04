library(tidyverse)
library(readr)
Scope_2 <- read_csv("Scope 2 and 3.csv", locale = locale(encoding = "latin1")) ##Used this to overcome Error in nchar(x, "width"): invalid multibyte string, element 1

# 1. Market vs Location (THE killer visual)
MB_vs_LB_S2 <- Scope_2 %>% select(Year, `Scope 2 MB (MtCO2e)`, `Scope 2 LB (MtCO2e)??`)
MB_vs_LB_S2_long <- pivot_longer(MB_vs_LB_S2, -Year, names_to = "Method", values_to = "Emissions")
scope2_p1 <- ggplot(MB_vs_LB_S2_long, aes(x = Year, y = Emissions, colour = Method)) +
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "Shell Scope 2: Market-Based vs Location-Based Reality") +
  theme_minimal()
print(scope2_p1)
ggsave("MB_vs_LB_Scope_2.png", scope2_p1, width = 10, height = 6)

# 2. Equity gap (if data gap is meaningful)
scope2_p1_EB <- Scope_2 %>% select(Year, `Scope 2 MB (MtCO2e)`, `Scope 2 MB EB (MtCO2e)`)
scope2_p1_EB_long <- pivot_longer(scope2_p1_EB, -Year, names_to = "Method", values_to = "Emissions")
scope_2_p2 <- ggplot(scope2_p1_EB_long, aes(x = Year, y = Emissions, colour = Method)) +
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "Shell Scope 2: Market Based vs Maket-Based Equity Boundary") +
  theme_minimal()
print(scope_2_p2)
ggsave("MB_vs_MBEB_Scope_2.png", scope_2_p2, width = 10, height = 6)

# 3. Scope 3 Customer use vs sold products 
Scope_3 <- Scope_2 %>% select(Year, `Scope 3 Customer use (MtCO2e)`, `Scope 3 Sold products (MtCO2e)`)
Scope_3_long <- pivot_longer(Scope_3, -Year, names_to = "Method", values_to = "Emissions")
Scope_3_p1 <- ggplot(Scope_3_long, aes(x = Year, y = Emissions, colour = Method)) + 
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "Shell Scope 3") +
  theme_minimal()
print(Scope_3_p1)
ggsave("Scope_3.png", Scope_3_p1, width = 10, height = 6)  
