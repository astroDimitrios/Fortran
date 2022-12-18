# Object Orientated Programming

- [Object Orientated Programming](#object-orientated-programming)
  - [Basics](#basics)
  - [Overloading Operators](#overloading-operators)
  - [Extended Class Types](#extended-class-types)
  - [Abstract Types](#abstract-types)
  - [Type Guarding](#type-guarding)

## Basics

**DO:** Define a class in a separate module.  
**DO:** Assign default values for members if possible.

Example [`ice_cream`](../11_OOP/Example1/ice_cream_class.f90) class:

```fortran
module ice_cream_class

    implicit none
    private

    ! make constructor interface public
    public ice_cream

    ! define class as a type
    type ice_cream
        integer                        :: balls = 0
        character(len=20)              :: flavour = 'Unknown'
        character(len=20), allocatable :: extras(:)
    contains
        private
        procedure, public :: add_balls    ! public function
        final             :: destructor   ! final destructor
    end type ice_cream

    ! interface for constructor
    interface ice_cream
        module procedure constructor
    end interface ice_cream

contains

    function constructor() result(this_ice_cream)
        type(ice_cream) :: this_ice_cream
        ! set any variables or call methods
        this_ice_cream%balls = 1 
    end function constructor

    ! type-bound method takes self argument
    subroutine add_balls(self, n)
        class(ice_cream), intent(inout) :: self
        integer, intent(in) :: n

        self%balls = self%balls + n
    end subroutine add_balls

    ! clean up pointers, deallocate, close file handlers etc.
    subroutine destructor(self)
        type(ice_cream) :: self
        if ( allocated(self%extras) ) deallocate(self%extras)
    end subrotuine destructor

end module ice_cream_class
```

`self` is a style choice based off Python OOP. You could use the C variant `this`. As long as you're consistent.

Destructor info taken from [dannyvanpoucke.be](https://dannyvanpoucke.be/oop-fortran-tut4-en/). Another useful resource [climate-cms wikis](http://climate-cms.wikis.unsw.edu.au/Object-oriented_Fortran).

This class can the be used in a main [program](../11_OOP/Example1/ice_cream_test.f90).

```fortran
program ice_cream_test

    use ice_cream_class, only: ice_cream
    implicit none

    type(ice_cream) :: whippy
    whippy = ice_cream()

    whippy%flavour = 'Vanilla'

    allocate( whippy%extras(1) ) 
    whippy%extras(1) = 'Flake'

    call whippy%add_balls(2)

    ! whippy moving out os scope for end program
    ! compiler does - call destructor(whippy)
end program ice_cream_test
```

**NOTE:** When `whippy` was declared memory was allocated. When we initialised `whippy = ice_cream()` the `ice_cream` constructor was called which initialised the instance then copied the instance via the assignment operator into new memory. Be careful when overloading the assignment operator, see below.  

**NOTE:** DO declare default to be private. You can also use `protected` which only allows modification in the host, otherwise only read access.

## Overloading Operators

You can overload operators such as `= */+-` for your class:

```fortran
... ! in the type contains section
contains
        private
        procedure, public :: add_balls
        ! procedures to be called
        procedure         :: add_ice_creams
        procedure         :: equate_ice_creams
        ! public overloaded operator/assignment
        generic, public   :: operator(+) => add_ice_creams
        generic, public   :: assignment(=) => equate_ice_creams
        final             :: destructor
...
```

Then:

```fortran
... ! in the module contains section
    type(ice_cream) function add_ice_creams( ice1, ice2 )
        class(ice_cream), intent(in) :: ice1, ice2

        ...
    end function add_ice_creams

    subroutine equate_ice_creams( lhs_ice, rhs_ice )
        class(ice_cream), intent(in)  :: rhs_ice
        class(ice_cream), intent(out) :: lhs_ice

        lhs_ice%balls = rhs_ice%balls
        lhs_ice%flavour = rhs_ice%flavour

        ...
    end subroutine equate_ice_creams
...
```

Full code in [`ice_cream`](../11_OOP/Example1/ice_cream_class.f90) class.

See [climate-cms](http://climate-cms.wikis.unsw.edu.au/Object-oriented_Fortran) for how to add your own operators.

## Extended Class Types

You can extend the class type above as in to create a child class. This inherits the membors and methods of the parent class. You can also overload the membors and methods.

Here we extend the `ice_cream` class:

```fortran
module vegan_ice_class

    use ice_cream_class, only: ice_cream
    implicit none
    private

    public vegan_ice

    type, extends(ice_cream) :: vegan_ice
        logical :: is_vegan = .true.
    contains
        procedure :: print => print_me
    end type vegan_ice

    interface vegan_ice
        module procedure init_vegan_ice
    end interface vegan_ice

contains

    type(vegan_ice) function init_vegan_ice()
        init_vegan_ice%balls = 1
    end function init_vegan_ice

    subroutine print_me(self)
        class(vegan_ice), intent(in) :: self

        print *, "EAT SORBET IF YOU'RE VEGAN"
    end subroutine print_me

end module vegan_ice_class
```

If the `ice_cream` class already had a `print_me` subroutine declared then the `vegan_ice` class overloads this `print_me` function. See an example by compiling and running [ice_cream_test.f90](../11_OOP/Example1/ice_cream_test.f90).

## Abstract Types

If you never intend to call the `ice_cream` class but use it as a base class then you can make it abstract. Methods can be ***deferred*** to the child types.

```fortran
module ice_cream_base
    implicit none
    private

    public :: ice_cream

    ! notice abstract here and before interface
    type, abstract :: ice_cream
        private
        logical, public :: holiday_only
    contains
        ! procedure all child classes must have
        procedure (holiday), deferred :: check_holiday
    end type ice_cream

    abstract interface
        subroutine holiday(self)
            import ice_cream
            class(ice_cream), intent(in) :: self
        end subroutine holiday
    end interface

end module ice_cream_base
```

Now we could define a child class:

```fortran
module holiday_ice_cream_class
    
    use ice_cream_base, only: ice_cream
    implicit none
    
    private
    public holiday_ice_cream

    type, extends(ice_cream) :: holiday_ice_cream
        private
    contains
        ! must have this procedure defined in base class
        procedure, public :: check_holiday
    end type holiday_ice_cream

    interface holiday_ice_cream
        module procedure init_holiday_ice_cream
    end interface holiday_ice_cream

contains

    type(holiday_ice_cream) function init_holiday_ice_cream()
        init_holiday_ice_cream%holiday_only = .true.
    end function init_holiday_ice_cream

    subroutine check_holiday(self)
        class(holiday_ice_cream), intent(in) :: self

        if ( self%holiday_only ) then
            print *, 'Holiday only ice cream'
        else
            print *, 'All year ice cream'
        end if
    end subroutine check_holiday

end module holiday_ice_cream_class
```

Full example in [Example2](../11_OOP/Example2/ice_cream_test.f90).

## Type Guarding

You can write a subroutine to work for multiple types. The code will have to behave differently for each type, this is ***type guarding***.

Use the `select type` construct, see info [here](https://www.intel.com/content/www/us/en/develop/documentation/fortran-compiler-oneapi-dev-guide-and-reference/top/language-reference/a-to-z-reference/s-1/select-type.html), example:

```fortran
! prints member variables from the ice_cream type
! passed to the subroutine

subroutine print_ice_cream(the_ice_cream)
    ! base abstract class
    use ice_cream_base, only: ice_cream
    ! summer child class - contains extra members to print
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
        ! not really needed here, if no match
        class default
            print *, 'Enjoy your ice cream.'
    end select

end subroutine print_ice_cream
```

Full example in [Example2](../11_OOP/Example2/ice_cream_test.f90).
