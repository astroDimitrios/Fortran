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

module bird_genus_class
    implicit none
    private

    public bird_genus

    type bird_genus
        private
        character(len=20)            :: genus_name, name
        integer                      :: incubation_period    ! days
        real                         :: mean_clutch_size     ! mean number of eggs
        integer                      :: life_span            ! days
        character(len=15)            :: diet
        logical                      :: survive_chick, survive_fledge
    contains
        private
        procedure, public            :: init
        procedure, public            :: hatch
        procedure, public            :: fledge
        procedure, public            :: forage
        ! print
        procedure, public            :: print => print_me
        procedure, public            :: get_genus         ! get genus_name
        procedure, public            :: get_name          ! get name
        procedure, public            :: survived_chick       ! get survive_chick
        procedure, public            :: survived_fledge      ! get survive_fledge
        procedure, pass(bird_copy)   :: equate_checks
        procedure                    :: equate_bird_genus
        generic, public              :: assignment(=) => equate_checks
        final                        :: destroy_bird_genus
    end type bird_genus

    interface bird_genus
        module procedure init_bird_genus
    end interface bird_genus

contains

    function init_bird_genus( genus, name, inc, clutch, life_span, &
                              diet) result(new_genus)
        implicit none
        type(bird_genus)              :: new_genus

        character(len=20), intent(in) :: genus, name
        integer, intent(in)           :: inc
        real, intent(in)              :: clutch    
        integer, intent(in)           :: life_span      
        character(len=15), intent(in) :: diet

        new_genus%genus_name        = genus
        new_genus%name              = name
        new_genus%incubation_period = inc
        new_genus%mean_clutch_size  = clutch
        new_genus%diet              = diet
        new_genus%life_span         = life_span
        new_genus%survive_chick     = .true.
        new_genus%survive_fledge    = .true.

    end function init_bird_genus

    ! not standard Fortran but won't call overloaded =
    ! if used to initialise the instance
    subroutine init( self, genus, name, inc, clutch, life_span, diet )
        implicit none
        class(bird_genus), intent(inout) :: self

        character(len=20), intent(in)    :: genus, name
        integer, intent(in)              :: inc
        real, intent(in)                 :: clutch   
        integer, intent(in)              :: life_span       
        character(len=15), intent(in)    :: diet

        self%genus_name        = genus
        self%name              = name
        self%incubation_period = inc
        self%mean_clutch_size  = clutch
        self%diet              = diet
        self%life_span         = life_span
        self%survive_chick     = .true.
        self%survive_fledge    = .true.

    end subroutine init

    ! call on a healthy adult to create and hatch chick
    subroutine hatch( self, chick )
        implicit none
        class(bird_genus), intent(in)    :: self
        class(bird_genus), intent(inout) :: chick

        real :: rand

        ! don't hatch from dead birds or chicks
        if ( .not. self%survive_fledge ) then
            write (*,*) 'Cannot hatch from a dead or young bird'
        else 
            call random_number(rand)
            chick = self

            if ( rand > 0.5 ) then
                chick%survive_chick  = .true.
                chick%survive_fledge = .false.

                chick%name = trim(chick%name) // ' Jnr'
                write (*,*) 'The chick survived! ', &
                            trim(chick%name),   &
                            ' is healthy.'
            else 
                chick%survive_chick  = .false.
                chick%survive_fledge = .false.
                
                write (*,*) 'The chick died...'
            end if
        end if

    end subroutine hatch

    ! test to see if the chick becomes an adult
    subroutine fledge(self)
        implicit none
        class(bird_genus), intent(inout) :: self

        real :: rand

        if ( .not. self%survive_chick ) then
            write (*,*) 'This bird is dead.'
        else if ( self%survive_fledge ) then
            write (*,*) ' This bird is already an adult.'
        else 
            call random_number(rand)

            if ( rand > 0.5 ) then
                self%survive_fledge = .true.
                write (*,*) 'The bird survived! ', &
                            trim(self%name),       &
                            ' is a healthy adult.'
            else 
                self%survive_fledge = .false.
                write (*,*) 'The bird died...'
                write (*,*) 'RIP ', trim(self%name)
            end if
        end if

    end subroutine fledge

    ! find food
    subroutine forage(self, found)
        implicit none
        class(bird_genus), intent(inout) :: self

        character(len=15)                :: food(4), found
        real                             :: rand
        integer                          :: i

        if ( self%survive_fledge ) then
            food(1) = 'nuts'
            food(2) = 'fruit'
            food(3) = 'seeds'
            food(4) = 'avocado toast'

            call random_number(rand)
            i     = 1 + floor( rand * size(food) )
            found = food(i)

            write (*,*) trim(self%name), ' found some ',  found
        else 
            write (*,*) 'Dead birds cannot forage!'
        end if

    end subroutine forage

    subroutine print_me(self)
        implicit none
        class(bird_genus), intent(in) :: self

        print *, '==============================='
        print *, 'Name:    ', self%name
        print *, 'Genus:   ', self%genus_name
        print *, '==============================='

    end subroutine print_me

    ! get genus
    character(len=20) function get_genus(self)
        implicit none
        class(bird_genus), intent(in) :: self

        get_genus = self%genus_name

    end function get_genus

    ! get name
    character(len=20) function get_name(self)
        implicit none
        class(bird_genus), intent(in) :: self

        get_name = self%name

    end function get_name

    ! return logical survive_chick
    logical function survived_chick(self)
        implicit none
        class(bird_genus), intent(in) :: self

        survived_chick = self%survive_chick

    end function survived_chick

    ! return logical survive_fledge
    logical function survived_fledge(self)
        implicit none
        class(bird_genus), intent(in) :: self

        survived_fledge = self%survive_fledge

    end function survived_fledge

    subroutine equate_checks( bird_copy, rhs_bird )
        implicit none
        class(bird_genus), intent(inout) :: bird_copy
        type(bird_genus), intent(in)     :: rhs_bird

        ! don't copy dead birds etc
        if ( rhs_bird%survive_fledge ) then
            call equate_bird_genus( bird_copy, rhs_bird )
        else if ( rhs_bird%survive_chick ) then
                call equate_bird_genus( bird_copy, rhs_bird )
        else 
            write (*,*) 'Cannot copy from a dead bird'
        end if

    end subroutine equate_checks

    ! overloaded assignment =
    subroutine equate_bird_genus( bird_copy, rhs_bird )
        implicit none
        class(bird_genus), intent(inout) :: bird_copy
        type(bird_genus), intent(in)     :: rhs_bird

        bird_copy%genus_name        = rhs_bird%genus_name
        bird_copy%name              = rhs_bird%name
        bird_copy%incubation_period = rhs_bird%incubation_period
        bird_copy%mean_clutch_size  = rhs_bird%mean_clutch_size
        bird_copy%life_span         = rhs_bird%life_span
        bird_copy%diet              = rhs_bird%diet
        bird_copy%survive_chick     = rhs_bird%survive_chick
        bird_copy%survive_fledge    = rhs_bird%survive_fledge

    end subroutine equate_bird_genus

    subroutine destroy_bird_genus(self)
        implicit none
        type(bird_genus) :: self

    end subroutine destroy_bird_genus

end module bird_genus_class