! Take any program from a previous exercise and change it to print its results.
!   a. Use list directed output to print to a console.
!   b. Use list directed output to print to a file. Remember to open the file appropriately.
!   c. Use formatted output to print to a file.
!   d. Use formatted output, print to a file, and add code for handling potential error conditions in the
!      output statement.

program ex1

    implicit none

    character(len=5)              :: a = 'Space'
    character(*), parameter       :: b = 'the final frontier!'
    character(len=:), allocatable :: c

    character(len=20)             :: space = 'Space'
    character(len=15)             :: str

    integer                       :: d = 5
    real                          :: e= 4.0, f, g

    ! file no for .dat
    integer :: rc
    integer :: file_unit
    
    c = a // ' ' // b
    f = real(d) + e
    g = f**2 / 37.4

    !write (*,*) c
    ! or
    !write (*,*) trim(space) // ' ' // b

    print '(4x, f5.2)', f

    ! 6 default terminal out
    write (6, 10) f
    10 format (4x, f15.7)

    open (8, file='ex1_data.txt')
    write (8, *) trim(space) // ' ' // b
    write (8, 10) f
    write (8, '(ES15.7)') g

    ! cast float to string
    write (str, '(ES15.7)') g
    ! remove whitespace and align left
    write (8, '(a)') adjustl(trim(str))

    close (8) 

    ! preferred
    open (action='write', file='ex1_data.dat', iostat=rc, newunit=file_unit)
    if (rc /= 0) stop 'Error: open failed'
    write (file_unit, *) 12
    close (file_unit)

end program ex1