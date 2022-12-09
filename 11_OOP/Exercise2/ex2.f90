! Write a class module that implements a bird_species object.
! This object will have attributes such as genus name, species name,
! incubation period, mean clutch size, diet preference,
! and average life span.
!
! The methods should include procedures: hatch, which returns a logical
! (i.e. did the chick survive);
! fledge, which also returns a logical for survival or not,
! and forage, which returns something to indicate whether
! the bird found food and if so, what it was.
!
! Write another module bird which extends bird_species to describe
! an individual of a particular species. 
! The attributes of each instance of this object will be those
! relevant to an individual, including age, gender, and whether
! it is currently breeding.
! Write a constructor for each type.
!
! Write a short program to test your modules.
!
! Compile:
! gfortran -c bird_genus_class.f90 
! gfortran -c toucan_species_class.f90
! gfortran -c ex2.f90
! gfortran -o ex2 ex2.o toucan_species_class.o bird_genus_class.o
! ./ex2

program ex2

    use bird_genus_class,     only: bird_genus
    use toucan_species_class, only: toucan
    implicit none

    ! for bird genus
    type(bird_genus)   :: bird_1, bird_2, child_bird
    character(len=20)  :: genus
    character(len=20)  :: name_1, name_2
    integer            :: inc, life_span
    real               :: clutch   
    character(len=15)  :: diet

    character(len=15)  :: food ! empty, for forage() to assign

    ! for toucan
    type(toucan)       :: toucan_1, child_toucan
    character(len=20)  :: species
    character(len=20)  :: name_t
    integer            :: inc_t, life_span_t
    real               :: clutch_t         
    ! toucan specifics
    integer            :: forages_per_day, food_per_day
    character(len=15)  :: diet_food

    genus     = 'Manticorus'
    name_1    = 'Larry'
    inc       = 30
    clutch    = 1.0
    diet      = 'Carnivore'
    life_span = 20000000

    ! also calls overloaded = after the constructor
    ! deep copy
    bird_1 = bird_genus( genus, name_1, inc, clutch, life_span, diet )
    
    call bird_1%hatch(child_bird) ! hatch chick from bird
    call child_bird%fledge()      ! check if it survives to adult

    call bird_1%forage(food)

    name_2 = 'Colin'
    ! does not call overloaded =
    ! uses already allocated memory when bird_2 was declared
    call bird_2%init( genus, name_2, inc, clutch, life_span, diet )

    print *, 'Toucan Species Class Test --------------------------'

    species         = 'Toco'
    name_t          = 'Splendora'
    inc_t           = 14
    clutch          = 1
    life_span_t     = 47000
    forages_per_day = 3
    food_per_day    = 2
    diet_food       = 'fruit'
    
    toucan_1 = toucan( species, name_t, inc_t, clutch_t, life_span_t, &
                       forages_per_day, food_per_day, diet_food )

    call toucan_1%print()
    
    call toucan_1%hatch_toucan(child_toucan)
    call child_toucan%fledge_toucan()

    print *, 'RUN LIFE Test --------------------------------------'
    call toucan_1%run_life()

end program ex2