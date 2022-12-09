! Write a class module that implements a bird_genus object.
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
! Write another module bird which extends bird_genus to describe
! an individual of a particular species. 
! The attributes of each instance of this object will be those
! relevant to an individual, including age, gender, and whether
! it is currently breeding.
! Write a constructor for each type.
!
! Write a short program to test your modules.

module toucan_species_class

    use bird_genus_class, only: bird_genus
    implicit none
    private

    public toucan

    type, extends(bird_genus) :: toucan
        private
        character(len=20)         :: species
        integer                   :: forages_per_day ! max forages per day
        integer                   :: forages_today   ! how many forages today
        integer                   :: food_per_day    ! food needed per day
        integer                   :: food_today      ! how much eaten today
        character(len=15)         :: diet_food       ! food bird can eat
        integer                   :: day             ! age
        logical                   :: survived_day    ! did bird survive day?
    contains
        private
        procedure, public          :: hatch_toucan
        procedure, public          :: fledge_toucan
        procedure, public          :: forage
        procedure, public          :: run_life
        procedure, public          :: print => print_toucan
        procedure, public          :: get_day
        procedure                  :: check_alive
        procedure, pass(touc_copy) :: equate_checks_toucan
        procedure                  :: equate_bird_species_toucan
        generic, public            :: assignment(=) => equate_checks_toucan
    end type toucan

    interface toucan
        module procedure init_toucan
    end interface toucan

contains

    type(toucan) function init_toucan( species, toucan_name, inc, clutch, &
                                       life_span, forages_per_day,        &
                                       food_per_day, diet_food, day )
        implicit none
        character(len=20), intent(in) :: species, toucan_name
        integer, intent(in)           :: inc
        real, intent(in)              :: clutch         
        integer, intent(in)           :: life_span
        integer, intent(in)           :: forages_per_day, food_per_day
        character(len=15), intent(in) :: diet_food
        integer, intent(in), optional :: day

        character(len=20)             :: genus
        character(len=15)             :: diet

        genus = 'Ramphastos'
        diet  = 'frugivore'
        
        ! pass bird_genus base class variables
        init_toucan%bird_genus = bird_genus( genus, toucan_name, inc, &
                                             clutch, life_span, diet )
        
        ! toucan specific variables
        init_toucan%species         = species
        init_toucan%forages_per_day = forages_per_day
        init_toucan%food_per_day    = food_per_day
        init_toucan%diet_food       = diet_food
        init_toucan%food_today      = 0
        init_toucan%forages_today   = 0
        init_toucan%survived_day    = .true.

        ! can start day not at 1 if you like
        if ( present(day) ) then 
            init_toucan%day = day
        else 
            init_toucan%day = 1
        end if

    end function init_toucan

    ! call on a healthy adult to create and hatch chick
    subroutine hatch_toucan( self, chick )
        implicit none
        class(toucan), intent(in)    :: self
        class(toucan), intent(inout) :: chick

        call self%bird_genus%hatch(chick%bird_genus)

    end subroutine hatch_toucan

    ! test to see if the chick becomes an adult
    subroutine fledge_toucan(self)
        implicit none
        class(toucan), intent(inout) :: self

        call self%bird_genus%fledge()

        if ( self%survived_fledge() ) then
            self%survived_day = .true.
        else 
            self%survived_day = .false.
        end if
    
    end subroutine fledge_toucan

    ! find food
    subroutine forage(self, found)
        implicit none
        class(toucan), intent(inout) :: self

        character(len=15)            :: food(6), found
        character(len=15)            :: need_food_print, day_print
        character(len=15)            :: day_days
        real                         :: rand
        integer                      :: i, need_food

        ! onlt forage if not dead and have forages left today
        if ( check_alive(self) ) then
            if ( self%forages_today < self%forages_per_day ) then
                ! all fine start foraging
                food(1) = 'nuts'
                food(2) = 'fruit'
                food(3) = 'seeds'
                food(4) = 'avocado toast'
                food(5) = 'fruit'
                food(6) = 'fruit'

                write (*,*) '# FORAGING'
                write (day_print, '(i8)') self%day
                write (*,*) 'Day ', trim(adjustl(day_print)), ': ', &
                            trim(self%get_name()),' is foraging'

                call random_number(rand)
                i = 1 + floor( rand * size(food) )
                found = food(i)

                write (*,*) trim(self%get_name()), ' found some ', &
                            trim(found), '.'

                ! test to see if toucan can eat the found food
                if ( found == self%diet_food ) then

                    self%food_today = self%food_today + 1
                    need_food = self%food_per_day - self%food_today
                    write (need_food_print, '(i8)') need_food

                    ! check if found enough food today
                    if ( need_food == self%food_per_day ) then
                        write (*,*) 'All full for today'
                    else
                        if ( .not. (need_food <= 0) ) then
                            write (*,*) 'Yummy, I need ',               &
                                        trim(adjustl(need_food_print)), &
                                        ' more ', trim(self%diet_food), &
                                        ' today.'
                        end if
                    end if
                else 
                    ! can't eat the food
                    need_food = self%food_per_day - self%food_today
                    write (need_food_print, '(i8)') need_food

                    ! '<pet_name> cannot eat <found>'
                    write (*,*) trim(self%get_name()), ' cannot eat ',  &
                                trim(found)
                    if ( need_food > 0 ) then
                        ! 'I need <x> more <diet_food> today'
                        write (*,*) 'I need ',                          &
                                    trim(adjustl(need_food_print)),     &
                                    ' more ', trim(self%diet_food), ' today.'
                    end if
                end if

                self%forages_today = self%forages_today + 1
                
                ! if max forages per day reached test for enough food
                ! if enough carry food over and increase day
                ! otherwise kill bird
                if ( self%forages_today == self%forages_per_day ) then
                    if ( self%food_today >= self%food_per_day ) then
                        write (*,*) 'So full, sleepy time.'
                        self%day = self%day + 1
                        self%forages_today = 0
                        self%food_today = self%food_today - self%food_per_day
                    else 
                        if ( self%day == 1 ) then
                            day_days = ' day old.'
                        else 
                            day_days = ' days old.' 
                        end if
                        ! 'Did not eat enough. <pet_name> died at <day> days old.'
                        write (*,*) 'Did not eat enough. ',                &
                                    trim(self%get_name()),                 &
                                    ' died at ', trim(adjustl(day_print)), &
                                    day_days
                        self%survived_day = .false.
                    end if
                end if
            else
                write (*,*) 'Only healthy adults can forage!'
            end if
        else 
            write (*,*) 'Only healthy adults can forage!'
        end if

    end subroutine forage

    ! runs forage() until the bird dies
    subroutine run_life(self)
        implicit none
        class(toucan), intent(inout) :: self

        character(len=15)            :: found

        ! if healthy adult toucan then forage until death
        if ( self%survived_day ) then
            do while ( self%survived_day )
                call self%forage(found)
            end do
        else 
            write (*,*) 'Bird is already dead...'
        end if

    end subroutine

    subroutine print_toucan(self)
        implicit none
        class(toucan), intent(in) :: self

        print *, '==============================='
        print *, 'Name:    ', self%get_name()
        print *, 'Genus:   ', self%get_genus()
        print *, 'Species: ', self%species
        print *, trim(self%get_name()), ' only eats ', self%diet_food
        print *, '==============================='

    end subroutine print_toucan

    integer function get_day(self)
        implicit none
        class(toucan), intent(in) :: self

        get_day = self%day

    end function get_day

    ! checks if the bird is a live adult
    logical function check_alive(self)
        implicit none
        class(toucan), intent(inout) :: self

        check_alive = .false.
        if ( self%survived_day ) check_alive = .true.

    end function check_alive

    subroutine equate_checks_toucan( touc_copy, rhs_bird )
        implicit none
        class(toucan), intent(inout) :: touc_copy
        class(toucan), intent(in)    :: rhs_bird

        ! don't copy dead birds etc
        if ( rhs_bird%survived_fledge() ) then
            if ( rhs_bird%survived_day ) then
                call equate_bird_species_toucan( touc_copy, rhs_bird )
            else 
                write (*,*) 'Cannot copy from a dead bird'
            end if
        else if ( rhs_bird%survived_chick() ) then
            call equate_bird_species_toucan( touc_copy, rhs_bird )
        else
            write (*,*) 'Cannot copy from a dead bird'
        end if

    end subroutine equate_checks_toucan

    ! overloaded assignment
    subroutine equate_bird_species_toucan( touc_copy, rhs_bird )
        implicit none
        class(toucan), intent(inout) :: touc_copy
        class(toucan), intent(in)    :: rhs_bird

        touc_copy%bird_genus = rhs_bird%bird_genus

        touc_copy%species         = rhs_bird%species
        touc_copy%forages_per_day = rhs_bird%forages_per_day
        touc_copy%diet_food       = rhs_bird%diet_food
        touc_copy%food_today      = rhs_bird%food_today
        touc_copy%forages_today   = rhs_bird%forages_today
        touc_copy%day             = rhs_bird%day
        touc_copy%survived_day    = rhs_bird%survived_day
        touc_copy%food_per_day    = rhs_bird%food_per_day

    end subroutine equate_bird_species_toucan

end module  toucan_species_class