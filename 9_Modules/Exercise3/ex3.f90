! Change one of the modules from the preceding exercise
! so that the functions will accept either real or
! double precision input values.
!
! Std Dev. Maths Link: https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap07/means-7.html
!
! Compile:
! gfortran -c my_stats.f90 constants_mod.f90
! gfortran -c ex3.f90 
! gfortran -o ex3 ex3.o my_stats.o constants_mod.o
! ./ex3

program ex3

    use constants_mod, only : r_native, dp_native
    use my_stats,      only : mean, std_dev
    implicit none

    integer              :: i
    integer, parameter   :: N = 5
    real(kind=dp_native) :: x(N)
    ! real(kind=r_native) :: x(N)
    
    x = [( i, i = 1, N )]
    print *, 'Array    = ', x
    print *, 'Mean     = ', mean(x)

end program ex3