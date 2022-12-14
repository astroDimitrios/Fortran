# Style Guide

> Short and simple Fortran statements are easier to read and understand than long and complex ones.

## Basics

- Header with copyright (all blank lines need `!`)
- Write your program in UK English
- lower case
- Optional space `end if`
- Full end with name `end subroutine test`


## Variables

- Declare and comment variables
- Variables lower case unless physicsal constant eg Rd can have capital
- Use `_` for names NOT camelCase
- Args declared sep to local variables
- Avoid the use of ‘magic numbers’ that is numeric constants hard wired into the code. Use parameters instead.
- Literal real values must always be given a kind using this syntax: `myvar = 1.23_r_mykind`


## General

- EXIT statements must be labelled
- Nested loops - label loops to improve readability
- Continued line marker & should be aligned