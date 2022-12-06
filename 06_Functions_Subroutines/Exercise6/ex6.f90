! Write a calling program for the outer_scope and inner_scope
! block in the text above.
! Add a variable x to the calling unit and set its value to 30.
! Print all x variables.
! What does this illustrate about variable scope?
! Print z in inner_scope.
!
! OUTPUT
! Start x =          30.0000000    
! Outer scope x =    10.0000000    
! Inner scope x =    20.0000000    
! y =                5.00000000    
! z = x + y =        25.0000000    
! Outer scope x 2 =  10.0000000    
! Start x 2 =        30.0000000  

program ex6

    implicit none

    interface
        subroutine outer_scope
        end subroutine
    end interface

    real :: x
    x = 30.0

    print *, 'start x = ', x
    call outer_scope
    print *, 'start x 2 =', x

end program

subroutine outer_scope
    real :: x, y
    x = 10.0
    y = 5.0
    print *, 'outer scope x = ', x
    call inner_scope
    print *, 'outer scope x 2 = ', x
contains
    subroutine inner_scope
        real :: x, z
        x = 20.0
        print *, 'inner scope x = ', x
        z = x + y
        print *, 'y = ', y
        print *, 'z = x + y = ', z
    end subroutine inner_scope
end subroutine outer_scope