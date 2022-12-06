! Write a module in which a type is defined consisting of 
! two reals and an array of undetermined size.
! Define the + operator for this type.
! Write a main program that uses the module,
! creates two of this type, and adds them.

! Compile:
! gfortran -c ice_cream_mod.f90 
! gfortran -c ex4.f90
! gfortran -o ex4 ex4.o ice_cream_mod.o
! ./ex4

program ex4

    use ice_cream_mod, only: ice_cream, operator (+)
    implicit none

    type(ice_cream) :: choc, rasp, combine

    choc = ice_cream(2, 5.2, 3.4, ['chocolate'])
    rasp = ice_cream(1, 2.1, 6.3, ['raspberry'])

    combine = choc + rasp

    print *, 'Number of Scoops = ', combine%no_balls
    print *, 'Fat   / g        = ', combine%fat_content
    print *, 'Water / g        = ', combine%water_content
    print *, 'Flavours: ', combine%flavours

end program ex4