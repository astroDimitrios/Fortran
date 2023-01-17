# OpenMP

```bash
OMP_NUM_THREADS=4 ./omp1
```

>Not defining this variable and the executable will create by default as many threads as cores it founds on the machine running the code.
>[21-OpenMP](https://wvuhpc.github.io/Modern-Fortran/21-OpenMP/index.html)
 
>The variable i is always private by default, For OpenMP in Fortran, the variable j is also private but this is not true for OpenMP in C. Same link as above.

???
Shared - ini newupdated all threads etc
Private - copied from master can change within/between threads
First private value copied from master - same for all threads
Last private value copied from last thread to new thread / master
