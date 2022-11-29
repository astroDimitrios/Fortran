! Use the derived type in the previous Exercise to create a
! linked list of species for the ecological model.
! Add the checks that were omitted from the code stub in the text
! (check for unassigned pointers, nullify all pointers not in use, etc.).

program ex3
    implicit none

    type species
        character(len=20) :: genus_name
        integer           :: population
        type(species), pointer :: next
    end type species

    integer :: rc, file_unit, i

    type(species), pointer :: current => null()
    type(species), pointer :: first => null()

    allocate(current)
    first => current

    open(action='read', file='ex3.csv', iostat=rc, newunit=file_unit)
    if (rc /= 0) stop

    do
        read (file_unit, *, iostat=rc) &
        current%genus_name, current%population  
        if (rc > 0) then
            write (*, *) 'Ahhh input error'
        else if (rc < 0) then
            exit
        else
            allocate(current%next)
            current => current%next
        end if
    end do
    
    close(file_unit)

    current => first ! point to beginning of the list

    do
        if (.not. associated(current%next)) exit
        print *, current%genus_name, current%population
        current => current%next
    end do

end program ex3