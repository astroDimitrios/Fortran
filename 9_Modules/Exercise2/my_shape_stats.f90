! Write another module that computes the standard deviation
! and the sample kurtosis of an input vector.
! Write a program that uses both modules,
! but loads the standard deviation function from this module
! under a different name.
! Compute the mean, standard deviation, and sample kurtosis
! for a vector obtained using the random_number intrinsic.

module my_shape_stats

    use ieee_arithmetic, only : ieee_support_inf,  &
                                ieee_positive_inf, &
                                ieee_value

    implicit none

    private
    public :: std_dev, kurtosis

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

    function kurtosis(x)
        implicit none

        real, intent(in)   :: x(:)
        integer            :: n
        real               :: m_4, m_2, x_minus_avg(size(x))
        real               :: kurtosis           

        n = size(x)
        if ( n < 2) stop 'Error: Cannot calculate the kurtosis' &
                         // ' of an array size 1 or 0'

        x_minus_avg = x - mean(x)
        m_4 = sum( x_minus_avg**4 ) / n
        m_2 = sum( x_minus_avg**2 ) / n

        if ( m_2 <= tiny(m_2) ) then 
            if (ieee_support_inf(kurtosis)) then
                kurtosis = ieee_value(kurtosis, ieee_positive_inf)
            end if
        else
            kurtosis = m_4 / m_2**2
        end if

    end function kurtosis
 
end module my_shape_stats