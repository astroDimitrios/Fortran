module my_powers
    implicit none
contains

    real function my_power_2(x)
        real :: x
        my_power_2 = x**2
    end function

    real function my_power_3(x)
        real :: x
        my_power_3 = x**3
    end function

end module my_powers