# Input and Output

Writing Files - ***[4_Input_and_Output/ex1.f90](../04_Input_and_Output/ex1.f90)***      
Reading Files - ***[4_Input_and_Output/ex2.f90](../04_Input_and_Output/ex2.f90)***     
Reading Namelists - ***[4_Input_and_Output/ex2.f90](../04_Input_and_Output/ex2.f90)***

**DO:** Always define the action when opening files using `open()`

## Basic Out

`print *, A`   
Or    
`write (*,*) A`

First `*` indicates num identifier of file.

## Basic Terminal Read

````fortran
print *, 'Enter a value:'
read *, A
````

## Print Formatting

`print '( 5x, I5/5x, I4 )', A, B`    
Skip 5 spaces, print integer    
New line

````fortran
print 10, i, a, b
10 format ( I5, 5F15.5 )

read ( 22, 100 ) c1, c2
100 format (A)
````

# Number Formatting

`nTw.d`

`n` - Number of times to repeat pattern (assumed 1)    
`T` - type (I, F, A (char), L, G etc)    
`w` - whitespace including spaces and decimal point     
`d` - number of decimal places

`Ew.den`     
where `en` is the number of digits in exponent    
not needed for 3 or less

`ES` for standard scientific notation