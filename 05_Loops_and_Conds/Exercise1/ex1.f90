! 1. Write a program that declares a real array of some particular size (N), 
!    using a parameter statement.
! 2. (Initialize the array to zero.)
!    Initialize the array with values from 1 to N.
! 3. Read in an integer variable from a file.
! 4. Test that the value is no greater than the upper bound of the array.
!    If it is, exit with an error message. If it is not, loop from 1 to the
!    input value, setting the I th array element to the cosine of the loop variable
!    (remember to cast appropriately).
! 5. Print out every 3rd element of the array so constructed.

program ex1

    implicit none

    ! 1 and 2
    integer                     :: i
    integer, parameter          :: N = 10
    real, dimension(N)          :: x = [(i, i = 1, N)]

    ! 3
    character(len=*), parameter :: FILE_NAME = 'ex1_num.txt'
    integer                     :: y, rc, file_unit

    open (action='read', file=FILE_NAME, iostat=rc, newunit=file_unit)
    if ( rc /= 0 ) stop 'Error: open failed' 

    do
        read (file_unit, *, iostat=rc) y
        if ( rc /= 0 ) exit
        print *, 'Y value from file = ', y
    end do

    ! 4
    if ( y > maxval(x) ) stop 'Error: file value larger than max array value'

    do i = 1, y
        x(i) = cos(real(i))
    end do

    print *, x
    ! 5 - every third element
    print *, x(1:N:3)

end program