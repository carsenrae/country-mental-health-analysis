import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.cm as cm

df = pd.read_csv("C:/Users/Carsen Rae Helms/OneDrive/Desktop from Surface Pro/Portfolio/Global Depression Trends/data/processed/top10_avg_depression.csv")
df = df.sort_values("avg_depression", ascending=True)

plt.figure(figsize=(10,6))

norm = plt.Normalize(df["avg_depression"].min(), df["avg_depression"].max())
colors = plt.cm.viridis(norm(df["avg_depression"]))

bars = plt.barh(df["Entity"], df["avg_depression"], color=colors)

# value labels
for i, v in enumerate(df["avg_depression"]):
    plt.text(v + 0.02, i, f"{v:.2f}", va='center', fontsize=9)

plt.xlabel("Average Depression Prevalence (%)")
plt.title("Top 10 Countries by Average Depression Prevalence")

plt.grid(axis='x', alpha=0.2)
plt.tight_layout()

plt.savefig("../images/global_depression_top10.png", dpi=300)
plt.show()