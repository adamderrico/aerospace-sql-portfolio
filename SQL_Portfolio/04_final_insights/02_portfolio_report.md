# Final Insights Report
### Aircraft Sensor Maintenance Dataset
### Author: Adam D'Errico

## Overview
This project analyzes an aircraft sensor maintenance dataset containing timestamped readings, sensor metadata, and risk labels. The goal is to demonstrate practical SQL skills used in aerospace analytics, including data exploration, risk assessment, trend analysis, and advanced query techniques such as window functions and CTE pipelines.

The analysis is structured into four stages:
1. **Exploration** – understanding dataset shape, sensor distribution, and value ranges
2. **Risk Analysis** – identifying high‑risk sensors and patterns
3. **Advanced Analytics** – applying window functions, rolling averages, and multi‑step CTE logic
4. **Final Insights** – summarizing which sensors show elevated readings and disproportionate high‑risk behavior

This report summarizes the key findings from the final stage.

---

## Key Findings

### 1. Sensors with Elevated Average Readings
Using safe numeric casting and aggregation, several sensors showed average readings **above the global mean** for their type. Elevated readings can indicate:
- calibration drift
- environmental stress
- early signs of component wear

These sensors warrant closer monitoring.

### 2. Sensors with Disproportionate High‑Risk Events
By comparing each sensor’s high‑risk count to the global average, the analysis highlights sensors that contribute more than expected to high‑risk classifications. These sensors may be:
- malfunctioning
- experiencing intermittent faults
- located in high‑stress zones

Identifying these sensors early supports proactive maintenance.

### 3. Combined Risk and Reading Assessment
The final query ranks sensors that meet **either** of the following criteria:
- above‑average reading values
- above‑average high‑risk event counts

Sensors meeting both criteria represent the highest‑priority items for engineering review. This combined approach mirrors real aerospace reliability workflows, where both performance drift and risk classification matter.

---

## Technical Highlights
This project demonstrates:
- **Data cleaning inside SQL** using regex‑based safe casting
- **CTE pipelines** to structure multi‑step logic
- **Window functions** for ranking and trend analysis
- **Risk segmentation** using conditional aggregation
- **Reproducible project structure** with organized `.sql` files

These techniques reflect the analytical patterns used in aerospace reliability, safety engineering, and data‑driven maintenance planning.

---

## Conclusion
This SQL project provides a clear demonstration of practical data analysis skills applied to a realistic aircraft sensor dataset. The final insights highlight sensors that may require further investigation due to elevated readings or high‑risk behavior. The structure, queries, and findings are designed to be transferable to future roles in data analytics, reliability engineering, or aerospace operations.