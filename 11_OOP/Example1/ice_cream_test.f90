! Compile:
! ifort -c ice_cream_class.f90
! ifort -c vegan_ice_class.f90
! ifort -c ice_cream_test.f90 
! ifort -o ice_cream ice_cream_test.o ice_cream_class.o vegan_ice_class.o
! ./ice_cream
!
! + operator not overloaded to work with vegan and
! non-vegan ice cream for obvious reasons

program ice_cream_test

    use ice_cream_class, only: ice_cream
    use vegan_ice_class, only: vegan_ice
    implicit none

    type(ice_cream) :: whippy, whippy_2, mega_whippy
    type(vegan_ice) :: vegan, vegan_2, mega_vegan
    whippy = ice_cream()

    whippy%flavour = 'Vanilla'

    allocate( whippy%extras(1) ) 
    whippy%extras(1) = 'Flake'

    call whippy%add_balls(2)

    whippy_2 = whippy

    whippy_2%flavour = 'Raspberry'
    deallocate( whippy_2%extras )

    mega_whippy = whippy + whippy_2
    call mega_whippy%print()

    vegan%flavour = 'Cherry'
    vegan_2 = vegan
    mega_vegan = vegan + vegan_2
    call mega_vegan%print()

    ! whippy etc. moving out of scope for end program
    ! compiler does - call destructor(whippy)
end program ice_cream_test