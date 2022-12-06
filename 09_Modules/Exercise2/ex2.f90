! Write another module that computes the standard deviation
! and the sample kurtosis of an input vector.
! Write a program that uses both modules,
! but loads the standard deviation function from this module
! under a different name.
! Compute the mean, standard deviation, and sample kurtosis
! for a vector obtained using the random_number intrinsic.
!
! Kurtosis Link: https://brownmath.com/stat/shape.htm
!
! Compile:
! gfortran -c my_stats.f90 my_shape_stats.f90
! gfortran -c ex2.f90 
! gfortran -o ex2 ex2.o my_stats.o my_shape_stats.o
! ./ex2

program ex2

    use my_stats,       only: mean, std_dev
    use my_shape_stats, only: std_dev2 => std_dev, kurtosis
    implicit none

    integer            :: i
    integer, parameter :: N = 1000
    real               :: x(N), k

    call random_number(x)

    print *, 'Mean      = ', mean(x)
    print *, 'Std Dev.  = ', std_dev(x)
    print *, 'Std Dev2. = ', std_dev2(x)

    k = kurtosis(x)
    print *, 'Kurtosis  = ', k

end program ex2