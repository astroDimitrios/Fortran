module my_powers
    implicit none
contains

    real function my_power_2(x)
        real :: x
        my_power_2 = x*x
    end function

    real function my_power_3(x)
        real :: x
        my_power_3 = x*x*x
    end function

end module my_powers