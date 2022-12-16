# Loops and Conditionals

- [Loops and Conditionals](#loops-and-conditionals)
  - [If](#if)
  - [Case](#case)
  - [Where](#where)
  - [Do Loop](#do-loop)
    - [Implied Do](#implied-do)
    - [Do While](#do-while)
    - [Do Concurrent](#do-concurrent)
  - [Forall](#forall)
  - [Exiting](#exiting)
  - [Termination](#termination)

## If

```fortran
if ( cond ) statement
! or
if ( cond ) then
    do this
else
    do this
end if
```  

## Case

```fortran
select case ( expression )
    case ( value1 )
        code
    case ( value2 )
        code
    case default ! optional
        code
end select
```

## Where

```fortran
where ( A < 0.0 ) A = 0.0

where ( I > 2 )
    A = 3
else where ( I < 0 )
    A = 4
end where
```

## Do Loop

```fortran
do i = start, stop, interval
    ...
end do
```

Endless do (without i) must have an exit statement.

**!!!! Loop over a matrix**  
Stored column wise so loop order - k, j, i

### Implied Do

```fortran
( a(i), i = 1, 10 )
((r(i, j), j = 1, 10), i = 1, 20)

data (((a(i, j, k), k= 1, 10), j = 1, 10), i = 1, 10) / 50. /
```

### Do While

Use not recommended, not well optimised (lrz course).

````fortran
do while ( cond )
    code
end do
````

### Do Concurrent

Attempts to parellise the do construct:

```fortran
do concurrent ( i = 1:N, j = 1:N )
    block
        real :: x
        x = a(i, j) + ...
        b(i, j) = x * c(j, i)
    end block
end do
```

The block construct removes flow dependency of x since it's created per iteration. Must not matter what order the loop is performed in.

LOTS of restrictions:

- No control statements, return, exit etc.
- No stop, sync, allocate etc.
- Procedures called MUST be PURE
- No use of IEEE flags etc.

See [llvm.org](https://flang.llvm.org/docs/DoConcurrent.html).

Fortran 2018 has extra locality options to remove flow dependency see [intel.com](https://www.intel.com/content/www/us/en/develop/documentation/fortran-compiler-oneapi-dev-guide-and-reference/top/language-reference/a-to-z-reference/c-to-d/do-concurrent.html).

Gfortran treats `do concurrent` the same as `do` but ensures that parellism is possible by enforcing the restrictions above. See [here](https://stackoverflow.com/questions/29928293/does-gfortran-take-advantage-of-do-concurrent).

## Forall

Not widely used - compiler choses fastest way to perform all operations, can be concurrent.

Sets diagonal elements of an array to 1:

````fortran
real :: a(n:n)
forall ( i = 1:n )  a(i, i) = 1
````

**NOTE:** Often worse than a do loop. Fortran 18 standard makes `forall` obsolete.

## Exiting

`cycle` - move onto next interation in loop. you should provide the name of the loop to cycle  
`exit` - exit loop fully, you should provide the name of the loop to exit

## Termination

Basics:

`stop`  
`error stop`  

Both can have integer or string constant after and printed to error output, default terminal.

**DO NOT:** Never use PAUSE or STOP on its own in favour of full error logging. See section [10 Exception Handling](./10_Exception_Handling.md) and logging.
