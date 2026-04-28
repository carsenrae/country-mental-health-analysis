import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("C:/Users/Carsen Rae Helms/OneDrive/Desktop from Surface Pro/Portfolio/Global Depression Trends/data/processed/top3_depression_trend.csv")


df.columns = df.columns.str.strip()

df["year"] = pd.to_numeric(df["year"], errors="coerce")
df["depression_pct"] = pd.to_numeric(df["depression_pct"], errors="coerce")

df = df.dropna(subset=["year", "depression_pct"])

plt.figure(figsize=(10,6))

for country in df["Entity"].unique():
    country_data = df[df["Entity"] == country].sort_values("year")
    plt.plot(
        country_data["year"],
        country_data["depression_pct"],
        label=country,
        linewidth=2
    )

plt.xlabel("Year", fontsize=12)
plt.ylabel("Depression Prevalence (%)", fontsize=12)
plt.title("Depression Prevalence Trends: Greenland, Morocco, and Lesotho", fontsize=14)

plt.legend()
plt.grid(alpha=0.3)

plt.tight_layout()
plt.savefig("../images/depression_trends_top_countries.png", dpi=300)
plt.show()
