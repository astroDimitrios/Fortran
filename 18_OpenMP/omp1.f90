! Compile:
! gfortran -fopenmp omp1.f90 -o omp1
! Run:
! OMP_NUM_THREADS=4 ./omp1

program omp1
    implicit none

    !$omp parallel

    print *, 'Everything is awesome!!!'

    !$omp end parallel
    
end program omp1
