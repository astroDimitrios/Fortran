! PART 1 
! Write a calling program for your hyperbolic cosine function.
! Test for both real and complex parameters. (I interpret as overload)
! For real parameters, you can use the cosh intrinsic to check that your function is correct.

! To compile:
! gfortran -c hypcosh.f90 
! gfortran -c ex2_1.f90 
! gfortran -o ex2_1 ex2_1.o hypcosh.o
! ./ex2_1

program ex2

    use hypcosh

    implicit none

    complex :: x = (1, 2)
    complex :: y

    real :: a = 5.0
    real :: b

    y = my_cosh(x)
    print *, 'y = ', y

    b = my_cosh(a)
    print *, 'b = ', b
    print *, 'Built in cosh = ', cosh(a)
    print *, 'Does it match mine? ', cosh(a) == b

end program ex2