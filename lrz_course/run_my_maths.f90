program run_my_maths
    use my_maths
    use my_powers
    implicit none

    real :: a, result
    a = 5

    call basic_maths(a, my_power_2, result)
    write(*, *) result

    call basic_maths(a, my_power_3, result)
    write(*, *) result

end program run_my_maths