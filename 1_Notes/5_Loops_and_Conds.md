# Loops and Conditionals

## Contents

1. [If](#1)
2. [Case](#2)
3. [Where](#3)
4. [Do Loop](#4)
    1. [Implied Do](#41)
    2. [Do While](#42)
5. [Forall](#5)
6. [Exiting & Termination](#6)

<a name="1"></a>
# If

````fortran
if ( cond ) statement
! or
if ( cond ) then
    do this
else
    do this
end if
````  

<br></br>
<a name="2"></a>
# Case

````fortran
select case ( expression )
    case ( value1 )
        code
    case ( value2 )
        code
    case default ! optional
        code
end select
````

<br></br>
<a name="3"></a>
# Where

````fortran
where ( A < 0.0 ) A = 0.0

where ( I > 2 )
    A = 3
else where ( I < 0 )
    A = 4
end where
````

<br></br>
<a name="4"></a>
# Do Loop

````fortran
do i = start, stop, interval
    code
end do
````
Endless do (without i) must have an exit statement.

**!!!! Loop over a matrix**    
Stored column wise so loop order - k, j, i

<a name="41"></a>
## Implied Do
````fortran
( a(i), i = 1, 10 )
((r( i, j ), j = 1, 10), i = 1, 20)

data (((a( i, j, k ), k= 1, 10), j = 1, 10), i = 1, 10) / 50. /
````

<a name="42"></a>
## Do While
Use not recommended, not well optimised (lrz course).

````fortran
do while ( cond )
    code
end do
````

<br></br>
<a name="5"></a>
# Forall

Not widely used - compiler choses fastest way to perform all operations, can be concurrent

sets diagonal elements of an array to 1:

````fortran
real :: a(n:n)
forall ( i = 1:n )  a( i, i ) = 1
````

<br></br>
<a name="6"></a>
# Exiting

`cycle` - move onto next interation in loop. you should provide the name of the loop to cycle     
`exit` - exit loop fully, you should provide the name of the loop to exit

# Termination

Basics: 

`stop`    
`error stop`    

Both can have integer or string constant after and printed to error output, default terminal.

<div style="color: black; background-color:rgba(255, 76, 48, 1); text-align:left; vertical-align: middle; padding: .3em; margin: .5em;">
    <strong>DO NOT:</strong>
  Never use PAUSE or STOP in favour of full error logging. See section !!!!!!!!!!!!!!!.
  </div>
