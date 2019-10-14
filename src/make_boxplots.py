"""
"""
import numpy as np
import pandas as pd
import seaborn as sns

sns.set(rc={'figure.figsize':(11.7,8.27)})

distances = pd.read_table("data/dist_normed.marker.tab", header=None)

#subset down to at least 25 marker genes in the smallest calculation.
distances = distances.iloc[(distances[2] > 5).tolist()]
print(distances.isna().sum())


alg_pair = distances[4]
signal = distances[5]


df = pd.DataFrame(dict(zip(["dtw distance", "algorithm-pair", "signal"], [distances[0],alg_pair,signal])))

ax = sns.boxplot(x="algorithm-pair", y="dtw distance", hue="signal", data=df, palette="colorblind", order=["monocle-monocle","dpt-dpt","monocle-dpt"])
fig = ax.get_figure()
fig.savefig("boxplots_normed.png")
