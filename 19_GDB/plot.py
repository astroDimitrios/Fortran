import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.cm as cm

name = './mandelbrot/data/mandelbrot_10000'
# name = './julia/data/julia_0.285_0.010_10000'

df= pd.read_csv(name+'.csv', header=None, dtype='float')

size = len(df)
# drop last empty column
del df[df.columns[-1]] 

fractal_set = name.split('/')[1]
if fractal_set == 'julia':
    cmap = cm.bone_r # julia
else:
    cmap = cm.viridis # mandelbrot

# set colour for stable numbers / members
masked_array = np.ma.masked_where(df== 100.0, df)
cmap.set_bad(color='black')

plt.imshow(masked_array, cmap=cmap, interpolation='none')
plt.gca().set_aspect("equal")
plt.axis("off")
plt.tight_layout()
# plt.show()

png_name = './'+fractal_set+'/plots/'+name.split('/')[-1]+'.png'
plt.savefig(png_name, dpi=1000, bbox_inches=None)
