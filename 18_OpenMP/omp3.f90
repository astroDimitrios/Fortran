! Compile:
! gfortran -fopenmp omp3.f90 -o omp3
! Run:
! OMP_NUM_THREADS=4 ./omp3

program omp3
    use, intrinsic :: omp_lib
    implicit none

    integer :: number_threads
    integer :: i

    integer :: i_cubed

    number_threads = omp_get_max_threads()
    print *, 'Number of threads = ', number_threads
    
    !$omp parallel do
    do i = 1, number_threads
        i_cubed = i ** 3
        print *, i, i_cubed
    end do
    !$omp end parallel do

    print *, 'Yikes!'

    ! i is private by default
    !$omp parallel do default(none) shared(number_threads) private(i, i_cubed)
    do i = 1, number_threads
        i_cubed = i ** 3
        print *, i, i_cubed
    end do
    !$omp end parallel do
    
end program omp3
