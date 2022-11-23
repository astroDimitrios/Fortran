! Take one of your earlier programs that performs some mathematical operation on at least two scalars.
! Change the program so that those numbers are input from a file, rather than being set in the program itself.
!   a. Use list directed input from a file.
!   b. Use formatted input from a file. Include instructions to handle error conditions.
!   c. Use a namelist to input the values.
!   d. Read several numbers (some real and some integer) into a program. Convert some of the numbers into
!      characters. Print the results in some informative manner.

program ex2

    use, intrinsic :: iso_fortran_env, only: stderr => error_unit
    implicit none

    ! parts a and b
    character(len=*), parameter :: FILE_NAME = 'ex2_data.txt'
    integer                     :: g, h, rc, file_unit

    ! parts c and d declarations
    character(len=32) :: code
    real              :: e
    integer           :: i

    open (action='read', file=FILE_NAME, iostat=rc, newunit=file_unit)
    if (rc /= 0) stop 'Error: open failed' 

    do
        read (file_unit, *, iostat=rc) g, h
        if (rc /= 0) exit
        print *, g, h
    end do

    close (file_unit)

    print *, g*h

    ! parts c and d code
    ! from https://cyber.dabamos.de/programming/modernfortran/namelists.html
    call read_namelist('ex2_namelist.nml', code, e, i)
    print '("e = ", i0)', i

contains
    subroutine read_namelist(file_path, code, e, i)
        !! Reads Namelist from given file.
        character(len=*),  intent(in)    :: file_path
        character(len=32), intent(inout) :: code
        real,              intent(inout) :: e
        integer,           intent(inout) :: i
        integer                          :: fu, rc

        ! Namelist definition.
        namelist /TEST/ code, e, i

        ! Check whether file exists.
        inquire (file=file_path, iostat=rc)

        if (rc /= 0) then
            write (stderr, '("Error: input file ", a, " does not exist")') file_path
            return
        end if

        ! Open and read Namelist file.
        open (action='read', file=file_path, iostat=rc, newunit=fu)
        read (nml=TEST, iostat=rc, unit=fu)
        if (rc /= 0) write (stderr, '("Error: invalid Namelist format")')

        close (fu)
    end subroutine read_namelist

end program ex2