! Write a module that computes the mean and standard deviation
! of the values in an input vector.
! Only the return values should be public;
! all internal variables should be declared private.
! Use the module in a program.
!
! Std Dev. Maths Link: https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap07/means-7.html
!
! Compile:
! gfortran -c my_stats.f90 
! gfortran -c ex1.f90 
! gfortran -o ex1 ex1.o my_stats.o
! ./ex1

program ex1

    use my_stats, only: mean, std_dev
    implicit none

    integer            :: i
    integer, parameter :: N = 5
    real               :: x(N)
    
    x = [( i, i = 1, N )]
    print *, 'Array    = ', x
    print *, 'Mean     = ', mean(x)
    print *, 'Std Dev. = ', std_dev(x)

end program ex1