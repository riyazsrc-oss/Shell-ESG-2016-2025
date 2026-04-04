library(tidyverse)
library(readr)
library(tidyr)
Social_KPIs <- read_csv("S and G KPIs.csv")

##1. Fatalities vs TRCF
## DUAL X AXIS
scale_factor <- max(Social_KPIs$Fatalities, na.rm = TRUE) / max(Social_KPIs$`TRCF (per million hours)`, na.rm = TRUE) * 1.0 
Social_KPI_P1 <- ggplot(Social_KPIs, aes(x = Year)) +
  geom_line(aes(y = `TRCF (per million hours)`, colour = "TRCF (per million hours)"), size = 1.2, alpha = 0.8, group = 1) +
  geom_point(aes(y = `TRCF (per million hours)`, colour = "TRCF (per million hours)"), size = 2.5, alpha = 0.8) +
  geom_line(aes(y = Fatalities / scale_factor, color = "Fatalities"), 
            size = 1.2, alpha = 0.8, group = 1) +
  geom_point(aes(y = Fatalities / scale_factor, colour = "Fatalities"), size = 2.5) +
  #### Dual Y Axis 
  scale_y_continuous(
    name = "TRCF (cases per million hours)",
    sec.axis = sec_axis(~ . * scale_factor, name = "Fatalities")
  ) +
  scale_color_manual(values = c("TRCF (per million hours)" = "#2E86AB", 
                                "Fatalities" = "#A23B72")) +
  
  labs(title = "Shell Safety: TRCF Down, Fatalities Volatile",
       subtitle = "2016-2025 | Dual-axis shows frequency vs absolute events",
       x = "Year") +
  
  theme_minimal() +
  theme(legend.position = "top",
        legend.title = element_blank(),
        axis.title.y.right = element_text(color = "#A23B72"),
        axis.title.y = element_text(color = "#2E86AB"))
ggsave("Shell_TRCF_vs_Fatalities_YoY.png", Social_KPI_P1, width = 10, height = 6, dpi = 300)

##2. Female employees vs % female board only 2020-2025 as pre 2020 no. female employees undisclosed
## Specifying data filters
rm(Social_KPIs_P2)

Social_KPIs_Filtered <- Social_KPIs %>%
  filter(Year >= 2020, !is.na(Social_KPIs$`Female Employees (1000s)`)) %>%
  select(Year, `Female Board %`, `Female Employees (1000s)`)
## Data being made long

Social_KPIs_long <- Social_KPIs_Filtered %>%
  pivot_longer(cols = c(`Female Board %`, `Female Employees (1000s)`), 
               names_to = "Metric", values_to = "Value")

Social_KPI_P2 <- ggplot(Social_KPIs_long, aes(x = Year, y = Value, fill = Metric)) +
  geom_col(position = "dodge", color = "white", size = 0.5) +
  scale_fill_manual(values = c("Female Board %" = "#2E86AB", 
                               "Female Employees (1000s)" = "#F18F01")) +
  labs(title = "Shell Diversity: Board vs Workforce",
       subtitle = "Female representation 2020-2025 | Employees in thousands",
       x = "Year", y = "Value") +
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = "top")
print(Social_KPI_P2)
ggsave("Shell_Diversity_BoardVsWorkforce.png", Social_KPI_P2, height = 6, width = 10, dpi = 300)       

#3. TCRF YoY
Social_KPIs_2 <- Social_KPIs %>% select(Year, `TRCF (per million hours)`)
Social_KPIs_2Long <- pivot_longer(Social_KPIs_2, -Year, names_to = "Key", values_to = "TRCF")
Social_KPI_P3 <- ggplot(Social_KPIs_2Long, aes(x = Year, y = TRCF, colour = Key)) + 
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "YoY TRCF") +
  theme_minimal()
print(Social_KPI_P3)
ggsave("YoY TRCF.png", Social_KPI_P3, height = 6, width = 10, dpi = 300)
