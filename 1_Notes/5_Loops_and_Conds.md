# Loops and Conditionals

## IF

````
if ( cond ) statement
! or
if ( cond ) then
    do this
else
    do this
end if
````

Care with floats:

````
use, intrinsic :: iso_fortran_env
implicit none

integer, parameter :: sp = REAL32
real(sp)      :: x = 1.
````

Using above these give:

`epsilon(x)` - 1.19209290E-07, effectively negligible no in x number model     
`huge(x)` - 3.40282347E+38, largest number    
`tiny(x)` - 1.17549435E-38, smallest number    

### Case

````
SELECT CASE ( expression )
    CASE ( value1 )
        code
    CASE ( value2 )
        code
    CASE DEFAULT ! optional
        code
END SELECT
````

## Where

````
where ( A < 0.0 ) A = 0.0

where ( I > 2 )
    A = 3.
else where ( I < 0 )
    A = 4.
end where
````

## Do loop

````
do i = start, stop, interval
    code
end do
````
Endless do (without i) must have an exit statement.

**!!!! Loop over a matrix**    
Stored column wise so loop order - k, j, i

### Implied Do
````
WRITE(15,*) (A(I), I=1,10)
READ(10,100) ((R(I,J), J=1,10), I=1,20)
PRINT *, ((S(I,J), I=1,20), J=1,10)
DATA (((A(I,J,K), K=1,10), J=1,10), I=1,10) / 50. /
````

### Do While
Use not recommended, not well optimised (lrz course).

````
do while ( cond )
    code
end do
````

#### Forall

Not widely used - compiler choses fastest way to perform all operations, can be concurrent

sets diagonal elements of an array to 1:

````
REAL, DIMENSION(N, N) :: A
FORALL (I=1:N)  A(I, I) = 1
````

# Exiting

`cycle` - move onto next interation in loop. you should provide the name of the loop to cycle     
`exit` - exit loop fully, you should provide the name of the loop to exit

# Termination

`stop`    
`error stop`    
Both can have integer or string constant after and printed to error output, default terminal.

