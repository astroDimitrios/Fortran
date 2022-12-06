! Write a module that computes the mean and standard deviation
! of the values in an input vector.
! Only the return values should be public;
! all internal variables should be declared private.
! Use the module in a program.

module my_stats

    implicit none
    private
    public :: mean, std_dev

contains

    real function mean(x) 
        implicit none

        real, intent(in) :: x(:)

        ! prevent empty array div by zero
        mean = sum(x) / max(1, size(x))
    end function mean

    real function std_dev(x)
        implicit none

        real, intent(in) :: x(:)
        integer          :: n
        real             :: sum_x, sum_sq_x, var

        n = size(x)
        if ( n < 2) stop 'Error: Cannot calculate the standard' &
                         // ' deviation of an array size 1 or 0'

        sum_x     = sum(x)
        sum_sq_x  = sum(x**2)
        var       = ( 1.0 / (n-1.0) ) * ( sum_sq_x - (sum_x * sum_x / n) )
        std_dev   = sqrt(var)
    end function std_dev
 
end module my_stats