! Write a program that declares some real and complex variables.
! Initialize the complex variables. Store the real part of one
! complex variable into a real variable and its imaginary part
! into another real variable.
! Add two complex variables and store the
! result into another.
! Multiply one complex variable by the conjugate of another.

program ex4

    implicit none

    complex :: b = ( 1.0, 2.0 )
    complex :: c = ( 1.0, 3.0 )

    integer :: br, bi
    complex :: d

    br = real(b)
    bi = aimag(b)

    d = b + c

    write (*,*) br
    write (*,*) bi
    write (*,*) d
    write (*,*) b * conjg(c)

end program ex4