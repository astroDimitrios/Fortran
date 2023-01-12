# MPI

Conda:  
OpenMPI didn't work :( - my mistake in code, should work now although tested with mpich
<https://anaconda.org/conda-forge/openmpi>

<https://anaconda.org/conda-forge/mpich>

Tutorial:
<https://wvuhpc.github.io/Modern-Fortran/40-MPI/index.html>

Intel `mpiifort` doesn't work - can't see how to install?

```bash
ld: cannot find -lmpifort
ld: cannot find -lmpigi
```

Toolkits?
<https://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html#gs.mcnzbp>

Different wrapper functions for each compiler:

<https://www.ch.cam.ac.uk/computing/software/intel-mpi>

- ifort: `mpiifort`
- gfortran: `mpif90`

From <https://wvuhpc.github.io/Modern-Fortran/40-MPI/index.html>

```fortran
call mpi_reduce( process_total, total, 1, mpi_double_precision, &
                     mpi_sum, 0, mpi_comm_world, error_number )
```

first is SEND values from each process, to go into RECEIVE total, use mpi_sum, total is on the master 0 process. Also `mpi_max`, `mpi_min`, `mpi_prod` etc. 1 - num elements of this datatype to be reduced.

> These two subroutines use as first parameter something called a communicator. In this particular case and for small codes the generic MPI_COMM_WORLD will include all processes created with mpirun. More complex codes could use multiple communicators and we can decide which ranks go to each of them.
> [Link](https://wvuhpc.github.io/Modern-Fortran/40-MPI/index.html)

MPICH had a problem with the F2008 header - 
```fortran
use :: mpi_f08
```
So use openmpi or mess around with mpich configure settings to use newer compiler

## OPENMPI specifying num processes, doesn't seem to matter with MPICH

Uses number of cores as default 1 process per core  
Use number of hardware threads instead:  

```bash
mpiexec --use-hwthread-cpus
```

Oversubscribe node to get more processes:

```bash
mpiexec --oversubscribe
```

```bash
mpiexec --map-by ppr:10:node:oversubscribe ./mcpi_MPI
```

or socket in above to replace node.
