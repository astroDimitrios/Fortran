! Compile:
! gfortran -c ice_cream_base.f90 
! gfortran -c holiday_ice_cream_class.f90
! gfortran -c summer_ice_cream_class.f90
! gfortran -c ice_cream_test.f90
! gfortran -o ice_cream ice_cream_test.o holiday_ice_cream_class.o summer_ice_cream_class.o ice_cream_base.o
! ./ice_cream

program ice_cream_test
    
    use holiday_ice_cream_class, only: holiday_ice_cream
    use summer_ice_cream_class, only: summer_ice_cream
    implicit none

    character(len=15)       :: name_hol
    character(len=15)       :: name_sum, fruit
    type(holiday_ice_cream) :: gingerbread
    type(summer_ice_cream)  :: rasp_ripple

    interface
        subroutine print_ice_cream(the_ice_cream)
            use ice_cream_base, only: ice_cream
            use holiday_ice_cream_class, only: holiday_ice_cream
            use summer_ice_cream_class, only: summer_ice_cream
            implicit none

            class(ice_cream) :: the_ice_cream
        end subroutine print_ice_cream
    end interface

    name_hol = 'Gingerbread'
    gingerbread = holiday_ice_cream(name_hol)

    call gingerbread%check_holiday()

    name_sum = 'Rasp Ripple'
    fruit = 'raspberry'
    rasp_ripple = summer_ice_cream(name_sum, fruit)

    call rasp_ripple%check_holiday()

    call print_ice_cream(gingerbread)
    call print_ice_cream(rasp_ripple)
    
end program ice_cream_test

subroutine print_ice_cream(the_ice_cream)
    use ice_cream_base, only: ice_cream
    use holiday_ice_cream_class, only: holiday_ice_cream
    use summer_ice_cream_class, only: summer_ice_cream
    implicit none

    class(ice_cream) :: the_ice_cream

    select type(the_ice_cream)
        ! type matches get executed first
        type is (summer_ice_cream)
            print *, 'Name:  ', the_ice_cream%name
            print *, 'Fruit: ', the_ice_cream%fruit
        ! if NO type match then match class
        class is (ice_cream)
            print *, 'Name: ', the_ice_cream%name
        ! not really needed here
        class default
            print *, 'Enjoy your ice cream.'
    end select

end subroutine print_ice_cream