# 🌍 Global Depression Diagnosis Trends Analysis

This project analyzes global depression disorder prevalence by country and year using SQL (DuckDB) and Python. The goal was to identify countries with the highest depression rates and determine whether those trends are driven by isolated spikes or consistent long-term patterns.

---

## 📊 Key Questions

- Which countries have the highest average depression prevalence?
- Are high rates driven by isolated years or consistent trends over time?
- How do top countries compare globally?

---

## 📈 Visual Insights

### Top 10 Countries by Average Depression Prevalence

![Top 10 Countries](images/global_depression_top10.png)

A global comparison shows Greenland, Morocco, and Lesotho among the highest-ranked countries. Greenland stands out with the highest overall average.

---

### Depression Trends Over Time (Top Countries)

![Trend Chart](images/depression_trends_top_countries.png)

Greenland maintains consistently elevated depression rates across all years. Morocco peaks in the early 2000s before declining, while Lesotho shows a steady upward trend over time.

---

## 🧠 Key Findings

- Greenland consistently exhibits the highest depression prevalence across all years  
- Morocco shows a peak followed by a gradual decline  
- Lesotho demonstrates a steady increase over time  
- High-prevalence countries are driven by sustained trends, not isolated spikes  

---

## ⚙️ Tools & Technologies

- **SQL (DuckDB)** — data cleaning and aggregation  
- **Python (pandas, matplotlib)** — visualization  
- **Git & GitHub** — version control and project sharing  

---

## 📂 Project Structure
country-mental-health-analysis/
│
├── data/
│ ├── raw/
│ └── processed/
│
├── scripts/
│
├── images/
│ ├── global_depression_top10.png
│ └── depression_trends_top3.png
│
├── sql/
│ └── mental_health_analysis.sql
│
└── README.md
---

## 🧾 SQL Example

```sql
SELECT
    Entity,
    AVG("Depression (%)") AS avg_depression
FROM mental_health_clean
GROUP BY Entity
ORDER BY avg_depression DESC
LIMIT 10;
