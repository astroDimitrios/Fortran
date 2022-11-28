! PART 2
!   a. Write a function that takes two scalar variables as input and returns their sum.
!   b. Change your sum function into a subroutine.
!   c. Write a subroutine that takes two scalar variables as input and returns a vector
!      with its first element the sum of the input, its second their difference,
!      its third their product, and its fourth their quotient.
!      Be sure to check for error conditions and return with a message if an illegal
!      operation would be attempted, specifically a division by a number that is effectively zero.

! Needs gfortran5 or ifort to compile with IEEE exceptions 
! rosettacode divide by zero check - https://rosettacode.org/wiki/Detect_division_by_zero#Fortran

program ex2_2

    implicit none

    real               :: a, b, sum_ab
    real, dimension(4) :: c
    real               :: d

    a = 3.
    b = 7.
    d = 0.

    sum_ab = scalar_sum(a, b)
    print *, 'Sum = ', sum_ab    

    call scalar_sum_sub(a, b, sum_ab)
    print *, 'Sum = ', sum_ab   

    call scalar_calcs(a, b, c)
    print *, 'Input a = ', a, ' b = ', b
    print *, 'Output = ', c  

    call scalar_calcs(a, d, c)
    print *, 'Input a = ', a, ' b = ', b
    print *, 'Output = ', c  

contains

    function scalar_sum(x, y) result(z)
        real, intent (in) :: x, y
        real              :: z
        
        z = x + y
    end function

    subroutine scalar_sum_sub(x, y, z)
        real, intent (in)  :: x, y
        real, intent (out) :: z

        z = x + y
    end subroutine

    subroutine scalar_calcs(x, y, z)

        real, intent (in)  :: x, y
        real, dimension(4) :: z 

        call check_divide_zero(x, y)

        z(1) = x + y
        z(2) = x - y
        z(3) = x * y
        z(4) = x / y

    end subroutine

    subroutine check_divide_zero(x, y)
        
        use :: ieee_exceptions
        implicit none

        real, intent (in)  :: x, y
        real    :: check
        logical :: flag
        flag = .false.

        call ieee_set_flag(ieee_divide_by_zero, .false.)
        check = x / y
        call ieee_get_flag(ieee_divide_by_zero, flag)

        ! Could stop the program
        ! if (flag) error stop 'Warning!  Division by zero detected'
        ! or continue
        if (flag) write (*, *) 'Warning!  Division by zero detected'

    end subroutine check_divide_zero

end program ex2_2