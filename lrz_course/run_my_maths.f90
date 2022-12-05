! Example program to call the basic_maths subroutine in my_maths
! Which in turn calls the my_powers functions and uses them
!
! To compile:
! gfortran -c my_maths.f90 my_powers.f90
! gfortran -c run_my_maths.f90 
! gfortran -o run_my_maths run_my_maths.o my_maths.o my_powers.o
!
! ./run_my_maths

program run_my_maths

    use my_maths
    use my_powers

    implicit none

    real :: a, result
    a = 5.0

    call basic_maths( a, my_power_2, result )
    write (*,*) result

    call basic_maths( a, my_power_3, result )
    write (*,*) result

end program run_my_maths