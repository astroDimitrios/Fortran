! Write a program that declares three character variables.
! Initialize two of them to any desired constant strings.
! Concatenate those two and store the result into the third.

PROGRAM ex3

    implicit none

    character(len=5) :: a = 'Space'
    character(*), parameter :: b = 'the final frontier!'
    character(len=:), allocatable :: c

    character(len=20) :: space = 'Space'
    
    c = a // ' ' // b

    Write (*,*) c

    ! or

    Write (*,*) trim(space) // ' ' // b

END PROGRAM ex3