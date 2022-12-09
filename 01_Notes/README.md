# Master Contents

0. [Useful Notes from Exercises](#1)
1. Intro
    1. [Basics](./01_0_Basics.md)
        1. [Introduction](./01_0_Basics.md#1)
        2. [Declaring Types](./01_0_Basics.md#2)
        3. [Declaring Variables](./01_0_Basics.md#3)
        4. [Block Construct](./01_0_Basics.md#4)
        5. [Precision](./01_0_Basics.md#5)
            1. [Precision Tips](./01_0_Basics.md#51)
    2. [Compile](./01_1_Compile.md)
2. [Basic Operations](./02_0_Basic_Operations.md)
    1. [Extra Char Assigment Example](./02_1_Char_Assign_Ex.md)
3. [Arrays](./03_Arrays.md)
4. [Input and Output](./04_Input_Output.md)
5. [Loops and Conditionals](./05_Loops_and_Conds.md)
    1. [If](./05_Loops_and_Conds.md#1)
    2. [Case](./05_Loops_and_Conds.md#2)
    3. [Where](./05_Loops_and_Conds.md#3)
    4. [Do Loop](./05_Loops_and_Conds.md#4)
        1. [Implied Do](./05_Loops_and_Conds.md#41)
        2. [Do While](./05_Loops_and_Conds.md#42)
    5. [Forall](./05_Loops_and_Conds.md#5)
    6. [Exiting & Termination](./05_Loops_and_Conds.md#6)
6. Functions and Subroutines
    1. [Basics](./06_0_Functions_Subroutines.md)
        1. [Basic Functions](./06_0_Functions_Subroutines.md#1)
            1. [Function result()](./06_0_Functions_Subroutines.md#11)
        2. [Subroutines](./06_0_Functions_Subroutines.md#2)
        3. [intent()](./06_0_Functions_Subroutines.md#3)
        4. [Explicit Interface](./06_0_Functions_Subroutines.md#4)
        5. [Argument Options](./06_0_Functions_Subroutines.md#5)
            1. [Optional Args](./06_0_Functions_Subroutines.md#51)
            2. [Keyword Args](./06_0_Functions_Subroutines.md#52)
            3. [Passing Args as Values](./06_0_Functions_Subroutines.md#53)
            4. [Functions as Args](./06_0_Functions_Subroutines.md#54)
        6. [Recursive Functions](./06_0_Functions_Subroutines.md#6)
        7. [SAVE ing variables !WARNING](./06_0_Functions_Subroutines.md#7)
        8. [Pure Functions](./06_0_Functions_Subroutines.md#8)
            1. [Elemental Functions](./06_0_Functions_Subroutines.md#81)
    2. [Modules](./06_1_Modules.md)
        1. [Internal Functions and Subroutines](./06_1_Modules.md#1)
        2. [External Modules](./06_1_Modules.md#2)
            1. [Compiling Notes](./06_1_Modules.md#21)
            2. [Public and Private Data](./06_1_Modules.md#22)
            3. [Use options](./06_1_Modules.md#23)
        3. [Archive Files](./06_1_Modules.md#3)
    3. [Overloading](./06_2_Overloading.md)
        1. [Procedure Overloading](./06_2_Overloading.md#1)
        2. [Operator Overloading](./06_2_Overloading.md#2)
7. [Memory Management](./07_Memory_Management.md)
    1. [Allocatable Arrays](./07_Memory_Management.md#1)
        1. [Assumed Shape and Automatic Arrays](./07_Memory_Management.md#11)
    2. [Pointers](./07_Memory_Management.md#2)
8. [Derived Types](./08_Derived_Types.md)
    1. [Derived Types](./08_Derived_Types.md#1)
    2. [Extending Types](./08_Derived_Types.md#2)
    3. [Linked List with Der Type Example](../08_Derived_Types/Exercise3/ex3.f90)
9. [Modules](./06_1_Modules.md) in notes at [6.2](./06_1_Modules.md)
10. [Excpetion Handling](./10_Exception_Handling.md)
    1. [IEEE Standard](./10_Exception_Handling.md#1)
    2. [IEEE Arithmetic](./10_Exception_Handling.md#2)
    3. [IEEE Exceptions](./10_Exception_Handling.md#3)
        1. [Ex: Divide by Zero](./10_Exception_Handling.md#31)
        2. [Ex: Overflow](./10_Exception_Handling.md#32)
11. [Object Orientated Programming](./11_OOP.md)
    1. [Basics](./11_OOP.md#1)
    2. [Overloading Operators](./11_OOP.md#2)
    3. [Extended Class Types](./11_OOP.md#3)
    4. [Abstract Types](./11_OOP.md#4)
    5. [Type Guarding](./11_OOP.md#5)

<br></br>

---
<a name="1"></a>
## Useful Notes from Exercises

### 2 Fundamentals
   
[ex2](../02_Fundamentals/ex2.f90) - Cast integer to real using `real(a)`        
[ex3](../02_Fundamentals/ex3.f90) - Character conc and trimming

### 3 Arrays

[ex2](../03_Arrays/ex2.f90) - write_matrix() subroutine

### 4 Input and Output

[ex1](../04_Input_and_Output/ex1.f90) - Writing to file and cast to string           
[ex2](../04_Input_and_Output/ex2.f90) - Read file, read namelist subroutine

### 5 Loops and Conditionals

[ex1](../05_Loops_and_Conds/Exercise1/ex1.f90) - Print every 3rd element
````fortran
print *, x(1:N:3)
````

### 6 Functions and Subroutines

[ex2_1](../06_Functions_Subroutines/Exercise2/Part1/ex2_1.f90) - Overloaded function      
[ex2_2](../06_Functions_Subroutines/Exercise2/Part2/ex2_2.f90) - **Divide by zero error** check with ieee exceptions

### 8 Derived Types

[ex3](../08_Derived_Types/Exercise3/ex3.f90) - Contains a Linked List. Reads a CSV of unknown length into data type.

## 9 Modules

[ex2](../09_Modules/Exercise2/ex2.f90) - Contains **IEEE Inf** use, and the `random_number` intrinsic, good module use example       
[ex3](../09_Modules/Exercise3/ex3.f90) - **CONSTANTS module**, proper use of KINDS and constants, good procedure overload example     
[ex4](../09_Modules/Exercise4/ex4.f90) - Overloaded + operator used on a derived type

## 10 Exception Handling

[ex2_2](../06_Functions_Subroutines/Exercise2/Part2/ex2_2.f90) - **Divide by zero error** check with ieee exceptions     
[ex2](../09_Modules/Exercise2/ex2.f90) - Contains **IEEE Inf** use, and the `random_number` intrinsic, good module use example   

## 11 Object Orientated Programming

[Example1](../11_OOP/Example1/) - Class, extended class, overloaded operator    
[Example2](../11_OOP/Example2/) - Abstract class, type guarding with `select type` construct    

[ex1](./Exercise1/ex1.f90) - Example of arrays held in 2D array, **creating 2D cartesian grid**    
**[ex2](./Exercise2/ex2.f90)** - FULL formatted class, extended class, overloaded assignment, getter functions     
