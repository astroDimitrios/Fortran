! Write a module that computes the mean and standard deviation
! of the values in an input vector.
! Only the return values should be public;
! all internal variables should be declared private.
! Use the module in a program.

module my_stats

    use constants_mod, only: r_native, dp_native

    implicit none
    private
    public :: mean, std_dev

    interface mean
        module procedure mean_sp
        module procedure mean_dp
    end interface mean

contains

    real function mean_sp(x) 
        implicit none

        real(kind=r_native), intent(in) :: x(:)

        ! prevent empty array div by zero
        mean_sp = sum(x) / max(1, size(x))
    end function mean_sp

    real function mean_dp(x) 
        implicit none

        real(kind=dp_native), intent(in) :: x(:)

        ! prevent empty array div by zero
        mean_dp = sum(x) / max(1, size(x))
    end function mean_dp

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