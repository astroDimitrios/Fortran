! Compile:
! gfortran -fopenmp omp2.f90 -o omp2
! Run:
! OMP_NUM_THREADS=6 ./omp2

program omp2
    use, intrinsic :: omp_lib
    implicit none

    integer :: number_threads
    integer :: i

    number_threads = omp_get_max_threads()
    print *, 'Number of threads = ', number_threads
    
    !$omp parallel do
    do i = 1, number_threads
        print *, 'Everything is awesome!!!'
    end do
    !$omp end parallel do
    
end program omp2
