# Shell-ESG-2016-2025
A 10 year analysis of Shell's Annual Report ESG data using RStudio: Extracting 35+ KIPs across Environmental, Social and Governance factors. Currently both Environmental and Social KPI data has been analysed via R and key findings/comparison points extracted. Governance KPI data being reviewed.

## Project aim
The aim of this project is to turn Shell’s public ESG disclosures into a clean, reproducible dataset and use it to examine how selected environmental, social, and governance indicators have changed over time.
I built this project partly as preparation for MSc Environmental Technology at Imperial and partly to strengthen my practical skills in sustainability analysis, data cleaning, and visualisation.

## Why I chose this project
Shell is useful for this kind of analysis because it publishes a large amount of sustainability data over many years, which makes it possible to track trends rather than look at a single reporting period.
I wanted a project that felt realistic, applied, and relevant to future sustainability/data roles, while still being simple enough to explain clearly and defensibly.

# Structure and Method
I cleaned the data into a structured format and selected only the KPIs that could be compared fairly across years.
**Data Gathering** - Used Data sources to collate data and create Excel Dashboards & CSVs. 
**Data Processing** - CSVs used in R to create visual representations of Key comparison points and Key data trends across 10 year scope. 
**Reporting** - Environmental section of project summarised via short LinkedIn post: https://www.linkedin.com/posts/riyaz-chowdhury-873633328_esg-sustainability-climaterisk-activity-7444698591178317824-9deX?utm_source=share&utm_medium=member_desktop&rcm=ACoAAFKs1BcBvCct06n122Y5iGeT_wLGBsqxkoY. 

# Data Sources 
- Shell Sustainability Supplement data 2025.
- Shell Sustainability report 2023
- Shell Sustaiability report 2020

# KEY Abbreviations
**MB** - Market Based.
**LB** - Location Based. 
**EB** - Equity Boundary.

# Breakdown 

**Environmental (25+ KPIs overall) (E of ESG)**
- Scope 1-3 CSVs produced via Excel Dashboards of each.
- Scope 1 Key KPIs assessed and comparison points: YoY NCI, YoY Gasses (CO2/CH4/HCF), Direct Scope 1 vs Scope 1 Equity Boundary (for assessing JV reliance).
- Scope 2 Key KPIs assessed and comparison points: MB vs LB Emissions, MB vs MBEB Emissions, Scope 3 Customer usage vs sold product emissions.
- Other KPIs: those outside of Scope 1-3, assessing Fresh Water Usage, Spillage/Spill Volume and Wastage.

**Social (5+ KPIs) (S of ESG)**
- Overall less reportable KPI's **(Environmental focus as data is in greater excess with more comparison standpoints over 10 year period)**
- CSV produced from extracted data within dashboard.
- Assessed KPIs: TRCF vs Fatalities YoY, YoY TRCF and %Female Diversity.

**Governance** - Data in reveiw
KPI's being reviewed:
- Fines/Penalties YoY
- Executive pau ratio (CEO vs Median Employee)
- Low Carbon Capex (% Total on renewable)

# Limitations
This project is based on public reporting, so it is limited by what Shell chooses to disclose and how it defines each metric.
Not every KPI is reported every year, and some metrics change format over time, which means not all values are directly comparable.
To keep the analysis honest, I excluded inconsistent metrics rather than filling gaps with assumptions.

# Notes
This project is intended as a learning and portfolio piece, not as a claim that any one KPI explains broader sustainability performance on its own.
Where reporting gaps exist, they are treated as part of the story rather than ignored.
