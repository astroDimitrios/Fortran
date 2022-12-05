# Master Contents

0. [Useful Notes from Exercises](#1)
1. Intro
    1. [Basics](./1_0_Basics.md)
        1. [Introduction](./1_0_Basics.md#1)
        2. [Declaring Types](./1_0_Basics.md#2)
        3. [Declaring Variables](./1_0_Basics.md#3)
        4. [Block Construct](./1_0_Basics.md#4)
        5. [Precision](./1_0_Basics.md#5)
            1. [Precision Tips](./1_0_Basics.md#51)
    2. [Compile](./1_1_Compile.md)
2. [Basic Operations](./2_0_Basic_Operations.md)
    1. [Extra Char Assigment Example](./2_1_Char_Assign_Ex.md)
3. [Arrays](./3_Arrays.md)
4. [Input and Output](./4_Input_Output.md)
5. [Loops and Conditionals](./5_Loops_and_Conds.md)
    1. [If](./5_Loops_and_Conds.md#1)
    2. [Case](./5_Loops_and_Conds.md#2)
    3. [Where](./5_Loops_and_Conds.md#3)
    4. [Do Loop](./5_Loops_and_Conds.md#4)
        1. [Implied Do](./5_Loops_and_Conds.md#41)
        2. [Do While](./5_Loops_and_Conds.md#42)
    5. [Forall](./5_Loops_and_Conds.md#5)
    6. [Exiting & Termination](./5_Loops_and_Conds.md#6)
6. Functions and Subroutines
    1. [Basics](./6_0_Functions_Subroutines.md)
        1. [Basic Functions](./6_0_Functions_Subroutines.md#1)
            1. [Function result()](./6_0_Functions_Subroutines.md#11)
        2. [Subroutines](./6_0_Functions_Subroutines.md#2)
        3. [intent()](./6_0_Functions_Subroutines.md#3)
        4. [Explicit Interface](./6_0_Functions_Subroutines.md#4)
        5. [Argument Options](./6_0_Functions_Subroutines.md#5)
            1. [Optional Args](./6_0_Functions_Subroutines.md#51)
            2. [Keyword Args](./6_0_Functions_Subroutines.md#52)
            3. [Passing Args as Values](./6_0_Functions_Subroutines.md#53)
            4. [Functions as Args](./6_0_Functions_Subroutines.md#54)
        6. [Recursive Functions](./6_0_Functions_Subroutines.md#6)
        7. [SAVE ing variables !WARNING](./6_0_Functions_Subroutines.md#7)
        8. [Pure Functions](./6_0_Functions_Subroutines.md#8)
            1. [Elemental Functions](./6_0_Functions_Subroutines.md#81)
    2. [Modules](./6_1_Modules.md)
        1. [Internal Functions and Subroutines](./6_1_Modules.md#1)
        2. [External Modules](./6_1_Modules.md#2)
            1. [Compiling Notes](./6_1_Modules.md#21)
            2. [Public and Private Data](./6_1_Modules.md#22)
            3. [Use options](./6_1_Modules.md#23)
        3. [Archive Files](./6_1_Modules.md#3)
    3. [Overloading](./6_2_Overloading.md)
        1. [Procedure Overloading](./6_2_Overloading.md#1)
        2. [Operator Overloading](./6_2_Overloading.md#2)
7. [Memory Management](./7_Memory_Management.md)
    1. [Allocatable Arrays](./7_Memory_Management.md#1)
        1. [Assumed Shape and Automatic Arrays](./7_Memory_Management.md#11)
    2. [Pointers](./7_Memory_Management.md#2)
8. [Derived Types](./8_Derived_Types.md)
    1. [Derived Types](./8_Derived_Types.md#1)
    2. [Extending Types](./8_Derived_Types.md#2)
    3. [Linked List with Der Type Example](../8_Derived_Types/Exercise3/ex3.f90)

<br></br>

---
<a name="1"></a>
## Useful Notes from Exercises

### 2 Fundamentals
   
[ex2](../2_Fundamentals/ex2.f90) - Cast integer to real using `real(a)`        
[ex3](../2_Fundamentals/ex3.f90) - Character conc and trimming

### 3 Arrays

[ex2](../3_Arrays/ex2.f90) - write_matrix() subroutine

### 4 Input and Output

[ex1](../4_Input_and_Output/ex1.f90) - Writing to file and cast to string           
[ex2](../4_Input_and_Output/ex2.f90) - Read file, read namelist subroutine

### 5 Loops and Conditionals

[ex1](../5_Loops_and_Conds/Exercise1/ex1.f90) - Print every 3rd element
````fortran
print *, x(1:N:3)
````

### 6 Functions and Subroutines

[ex2_1](../6_Functions_Subroutines/Exercise2/Part1/ex2_1.f90) - Overloaded function      
[ex2_2](../6_Functions_Subroutines/Exercise2/Part2/ex2_2.f90) - Divide by zero error check with ieee exceptions

### 8 Derived Types

[ex3](../8_Derived_Types/Exercise3/ex3.f90) - Contains a Linked List. Reads a CSV of unknown length into data type.