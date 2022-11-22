! Write a program that adds a real number to an integer.
! Follow correct style and be sure to cast one of the numbers appropriately.

PROGRAM ex2

    implicit none

    integer :: a = 5, b = 4.
    integer :: c

    c = real(a) + b
    
    Write (*,*) c

END PROGRAM ex2