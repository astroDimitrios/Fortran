import pandas as pd
import matplotlib.pyplot as plt

from matplotlib import colors

df = pd.read_csv('ex3_data.csv', header=None)
# print(df)

size = len(df)
df.drop([0, size-1], inplace=True)
df.drop([0, size-1], axis=1, inplace=True)
# print(df)

im = plt.imshow(df, norm=colors.LogNorm())
plt.colorbar(im)
plt.show()