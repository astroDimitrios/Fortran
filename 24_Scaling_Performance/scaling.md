# Scaling

<https://www.kth.se/blogs/pdc/2018/11/scalability-strong-and-weak-scaling/>

## Speed Up

$$S(N,P) = \frac{T(N,1)}{T(N,P)}$$

where $S<P$

N       = 1,000,000,000  
T(N,1)  = 32.6353721618652 s  
T(N,2)  = 17.4959278106689 s  
T(N,10) = 10.8867626190186 s

S(N,2)  = 1.865
S(N,10) = 2.998

## Parallel Efficiency

$$E(N,P) = \frac{S(N,P)}{P}$$

E(N,2)  = 0.9325  
E(N,10) = 0.2998

E(N,P) < 1

## Serial Efficiency

These are T best  
T(N,1) = 44.8814353942871 s   
T(N,1) = 32.6353721618652 s    
T(N,1) = 32.6693077087402 s  
T(N,1) = 32.7228050231934 s  

T(N,1) = 34.4817428588867 s

$$E(N) = \frac{T_{best}(N)}{T(N,1)}$$

numerator is best optimised serial code  
denominator is parallel code on 1 processor

E(N) = 0.946

E(N) <= 1


## Scaling

- Strong scaling, fixed N and inc P
- Weak scaling, N increases same rate as P so # work per P is same

Amdahl's law - speedup is limited by the proportion of code that can be parallelised

Gustafson's Law - tend to scale problem size with number of cores so serial fraction becomes less important

Must think about load imbalance
