# Input and Output

## Basic Out

`print *, A`   
Or    
`Write(*,*) A`

First `*` indicates num identifier of file.

## Basic Terminal Read

````
Print *, 'Enter a value:'
Read *, A
````

## Print Formatting

`Print '(5x, I5/5x, I4)', A, B`    
Skip 5 spaces, print integer    
New line

````
print 10, i, a, b
10 format(I5, 5F15.5)

read(22, 100) c1, c2
100 format(2a)
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