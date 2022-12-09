! Compile:
! gfortran -c bird_genus_class.f90 
! gfortran -c toucan_species_class.f90 
! gfortran -c toucan_stats.f90 
! gfortran -o toucan_stats toucan_stats.o toucan_species_class.o bird_genus_class.o
! ./toucan_stats

program toucan_stats
    use toucan_species_class, only: toucan
    implicit none

    integer, parameter :: N = 1000
    integer            :: i
    type(toucan)       :: toucans(N)

    character(len=20)  :: species, name   
    integer            :: inc             ! incubation period, days
    real               :: clutch          ! mean number of eggs
    integer            :: life_span       ! days
    integer            :: forages_per_day ! max forages per day   
    integer            :: food_per_day    ! food needed per day
    character(len=15)  :: diet_food       ! food bird can eat

    ! file no for .dat
    integer            :: rc
    integer            :: file_unit
    character(len=20)  :: file_name

    species         = 'Toco'
    name            = 'Splendora'
    forages_per_day = 3
    food_per_day    = 2
    diet_food       = 'fruit'
    inc             = 14
    clutch          = 1
    life_span       = 47000

    ! write the days to file
    file_name = 'toucan_stats.txt'
    open (action='write', file=file_name, iostat=rc, newunit=file_unit)
    if (rc /= 0) stop 'Error: open failed'

    do i = 1, N

        toucans(i) = toucan( species, name, inc, clutch, life_span, &
                             forages_per_day, food_per_day, diet_food )

        call toucans(i)%run_life()
        write (file_unit, *) toucans(i)%get_day()

    end do

    close (file_unit)

end program toucan_stats