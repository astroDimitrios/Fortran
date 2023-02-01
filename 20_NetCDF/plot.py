import numpy as np
import netCDF4 as nc
import matplotlib.pyplot as plt
import matplotlib.cm as cm

name = './mandelbrot/data/mandelbrot_10000'
# name = './julia/data/julia_0.285_0.010_10'
file_name = name+'.nc'
ds = nc.Dataset(file_name)

# print(ds.variables.keys())
matrix = ds.variables[name.split('/')[-1]]
# print(matrix)
# print(matrix[:,:]) # data
data = np.rot90(matrix[:,:])

size = matrix.shape[0]

fractal_set = name.split('/')[1]
if fractal_set == 'julia':
    cmap = cm.bone_r # julia
else:
    cmap = cm.viridis # mandelbrot

# set colour for stable numbers / members
masked_array = np.ma.masked_where(data== 100.0, data)
cmap.set_bad(color='black')

plt.imshow(masked_array, cmap=cmap, interpolation='none')
plt.gca().set_aspect("equal")
plt.axis("off")
plt.tight_layout()
# plt.show()

png_name = './'+fractal_set+'/plots/'+name.split('/')[-1]+'.png'
plt.savefig(png_name, dpi=1000, bbox_inches=None)
