! Write a program that declares three character variables.
! Initialize two of them to any desired constant strings.
! Concatenate those two and store the result into the third.

program ex3

    implicit none

    character(len=5)              :: a = 'space'
    character(*), parameter       :: b = 'the final frontier!'
    character(len=:), allocatable :: c

    character(len=20)             :: space = 'space'
    
    c = a // ' ' // b

    write (*,*) c

    ! or

    write (*,*) trim(space) // ' ' // b

end program ex3