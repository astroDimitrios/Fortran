! Write a calling program for the outer_scope and inner_scope
! block in the text above.
! Add a variable x to the calling unit and set its value to 30.
! Print all x variables.
! What does this illustrate about variable scope?
! Print z in inner_scope.

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

    REAL :: x
    x = 30.

    print *, 'Start x = ', x
    call outer_scope
    print *, 'Start x 2 =', x

end program

SUBROUTINE outer_scope
    REAL :: x, y
    x = 10.
    y = 5.
    print *, 'Outer scope x = ', x
    call inner_scope
    print *, 'Outer scope x 2 = ', x
CONTAINS
    SUBROUTINE inner_scope
        REAL :: x, z
        x = 20.
        print *, 'Inner scope x = ', x
        z = x + y
        print *, 'y = ', y
        print *, 'z = x + y = ', z
    END SUBROUTINE inner_scope
END SUBROUTINE outer_scope