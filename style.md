# Style Guide

- Header with copyright (all blank lines need `!`)
- Write your program in UK English
- lower case
- Variables lower case unless physicsal constant eg Rd can have capital
- Use `_` for names NOT camelCase
- Optional space `end if`
- Full end with name `end subroutine test`

KEEP ABOVE

---

SAVE FOR LATER:
- - For instance use IOSTAT and IOMSG when using READ or OPEN
- No trailing whitespace
- Example of using spaces
```fortran
    integer(i_def), allocatable :: dofmap(:,:)
    type( field_type ), pointer :: exner_theta => null()
    call invoke( my_kernel_type( field1, field2 ) )
    varbeta = 1.0 - varalpha
    if (use_wavedynamics) then
        call invoke( aX_plus_bY( u_adv, varbeta,
state_after_slow(igh_u), varalpha, state(igh_u) ) )
```

- Comment code
- Indent comments
- NEVER use tabs

- `USE <module>, ONLY : <variables>`
- Use implicit none (and in funcs and subroutines)
- Use INTENT()
- Declare and comment variables
- Args declared sep to local variables
- Avoid the DIMENSION attribute or statement. Declare the dimension with the declared variables which
improves readability.
Common practice    
INTEGER, DIMENSION(10,20) :: a, b, c     
Better approach    
INTEGER :: a(10, 20), b(10, 20), c(10, 20)
- Allocate and deallocate in same scope
- Allocate and deallocate in reverse order
ie allocate A then B then C, deallocate C, then, B then A avoids memory defrag
- Define pointers to NULL()
- Make sure to NULLIFY() pointers at end of scope

- Avoid the use of ‘magic numbers’ that is numeric constants hard wired into the code. Use parameters instead.
- EXIT statements must be labelled
- Nested loops - label loops to improve readability

- Comparing real numbers:
Common practice
```fortran
IF ( real1 == real2 ) THEN
...
END IF
```Better approach
```fortran
IF ( ABS(real1 - real2) < small_number ) THEN
...
END IF
```
- Literal real values must always be given a kind using this syntax: `myvar = 1.23_r_mykind`

- Initialise arrays using [] not (//)
- COntinued line marker & should be aligned
- Short and simple Fortran statements are easier to read and understand than long and complex ones.
Where possible, avoid using continuation lines in a statement.
- Try to avoid string continuations and spread the string across multiple lines using concatenations `//`
instead.

- Always define action when OPENing files
- Use IOSTAT and IOMSG