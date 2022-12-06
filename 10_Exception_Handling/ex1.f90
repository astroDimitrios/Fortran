! Write a function that computes 𝑦/𝑥
! Your function should start with
! use ieee_arithmetic
! use ieee_features
! Invoke the ieee_is_finite function to check for
! division by zero and if it occurs, return y = -999,
! otherwise return the quotient
!
! This is obviously a contrived Test your function with x equal
! and not equal to zero. Remember that the name of the function
! can be treated as any other floating point value and
! can be an argument to the ieee_is_finite procedure.

program ex1

    use ieee_arithmetic
    use ieee_features
    implicit none

    real :: x, y, fraction 

    y = 1.0
    x = 0.0

    fraction = y/x
    if ( ieee_is_finite(fraction) ) then
        print *, fraction
    else
        print *, 'Division by zero!'
        fraction = -999.0
        print *, fraction
    end if
    
end program ex1