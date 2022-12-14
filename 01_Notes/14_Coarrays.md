# Coarrays

> Directory [link](../14_Coarrays/).

## Contents

1. [Basics](#1)
2. [Ex: Monte Carlo Pi](#2)
3. [Links](#3)

<a name="1"></a>
# Basics

Coarrays can split a program into multiple images.    
Images can have their own local variables and shared variables.    

> A coarray can be thought of as having extra dimensions, referred to as codimensions.
>
> [Intel](https://www.intel.com/content/www/us/en/docs/fortran-compiler/tutorial-coarray/18-0/modifying-the-program-to-use-coarrays.html)

Declare as:
```fortran
real :: total[*] ! preferred
real, codimension[*] :: total
```
Here the `total` coarray will exist on each image. Access it with `total[i]` where `i` is the image number.

The number of images `*` is determined by the compiler.     
**Limits:** Must not exceed `15`, total array bounds must not exceed `31`.

To access the total number of images:
```fortran
num_images()
```

To access the number of the current image:
```fortran
this_image()
```

To sync all images at a specific point of the program:
```fortran
sync all
```


<br></br>
<a name="2"></a>
# Ex: Monte Carlo Pi

Based off the Intel Tutorial linked [here](https://www.intel.com/content/www/us/en/docs/fortran-compiler/tutorial-coarray/18-0/overview.html) and <a href="3">below</a>.

The value of Pi is calculated using a Monte Carlo Method.    
Imagine a circle, radius $1$, in a square, side $2$.

Circles area = $\pi r^2$     
Squares area = $4$ = $4r^2$ since $r=1$

Random sampling two variables $x$ and $y$ between $[0, 1]$ then testing:
$x^2 + y^2 \leq 1$ to see if it lies in the circles top right quadrant, gives the value of $\pi$:

$$\pi = 4\times \frac{points\ in\ circle}{total\ points\ sampled}$$

Since:

$$\frac{Area\ Circle}{Area\ Square} = \frac{\pi r^2}{4r^2} = \frac{\pi}{4}$$

The ratio $\frac{points\ in\ circle}{total\ points\ sampled}$ approaches the ratio $\frac{Area\ Circle}{Area\ Square}$ as $lim_{total\ points\ sampled\to\infty}$.

**CODE:** 
- The [sequential form](../14_Coarrays/mcpi_sequential.f90)
- The [coarray form](../14_Coarrays/mcpi_coarray.f90)

In the coarray form each image performs a fraction of the sampling.   

Notice $\pi$ is only calculated after all images have synced using `sync all` to avoid accessing each images total points in the circle before they have finished sampling.

Also notice how only the first image (image 1) starts/stops the clock and performs the $\pi$ calc etc. Otherwise all images would attempt to do this.

> For best performance, minimize touching the storage of other images.
>
>In a coarray application, each image has its own set of I/O units. The standard input is preconnected only on image 1. The standard output is preconnected on all images. The standard encourages the implementations to merge output, but the order is unpredictable. Intel® Fortran supports this merging. 
>
> [Intel](https://www.intel.com/content/www/us/en/docs/fortran-compiler/tutorial-coarray/18-0/modifying-the-program-to-use-coarrays.html)

<br></br>
<a name="3"></a>
# Links

- Tutorial: Coarray Fortran Overview, Intel, https://www.intel.com/content/www/us/en/docs/fortran-compiler/tutorial-coarray/18-0/overview.html
- Programming models for HPC, https://annefou.github.io/Fortran/coarrays/coarrays.html