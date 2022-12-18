# Master Contents

[Useful Notes from Exercises](#useful-notes-from-exercises)

0. [Glossary](./00_Glossary.md)
1. Intro
    1. [Basics](./01_0_Basics.md)
        1. [Introduction](./01_0_Basics.md#introduction)
        2. [Declaring Kinds (Basic)](./01_0_Basics.md#declaring-kinds-basic)
        3. [Declaring Variables](./01_0_Basics.md#declaring-variables)
        4. [Block Construct](./01_0_Basics.md#block-construct)
        5. [Kinds / Precision](./01_0_Basics.md#kinds--precision)
            1. [Precision Tips](./01_0_Basics.md#tips)
    2. [Compile](./01_1_Compile.md)
2. [Basic Operations](./02_0_Basic_Operations.md)
    1. [Extra Char Assigment Example](./02_1_Char_Assign_Ex.md)
3. [Arrays](./03_Arrays.md)
    1. [Basics](./03_Arrays.md#basics)
    2. [Intrinsic Functions](./03_Arrays.md#intrinsic-functions)
4. [Input and Output](./04_Input_Output.md)
    1. [Basics](./04_Input_Output.md#basics)
    2. [Example Read / Write](./04_Input_Output.md#example-read--write)
        1. [Read](./04_Input_Output.md#read)
        2. [Write](./04_Input_Output.md#write)
    3. [Internal I/O](./04_Input_Output.md#internal-io)
    4. [Formatting](./04_Input_Output.md#print-formatting)
5. [Loops and Conditionals](./05_Loops_and_Conds.md)
    1. [If](./05_Loops_and_Conds.md#if)
    2. [Case](./05_Loops_and_Conds.md#case)
    3. [Where](./05_Loops_and_Conds.md#where)
    4. [Do Loop](./05_Loops_and_Conds.md#do-loop)
        1. [Implied Do](./05_Loops_and_Conds.md#implied-do)
        2. [Do While](./05_Loops_and_Conds.md#do-while)
        3. [Do Concurrent](./05_Loops_and_Conds.md#do-concurrent)
    5. [Forall](./05_Loops_and_Conds.md#forall)
    6. [Exiting & Termination](./05_Loops_and_Conds.md#termination)
6. Functions and Subroutines
    1. [Basics](./06_0_Functions_Subroutines.md)
        1. [Basic Functions](./06_0_Functions_Subroutines.md#functions)
            1. [Function result()](./06_0_Functions_Subroutines.md#function-result)
        2. [Subroutines](./06_0_Functions_Subroutines.md#subroutines)
        3. [intent()](./06_0_Functions_Subroutines.md#intent-)
        4. [Explicit Interface](./06_0_Functions_Subroutines.md#explicit-interface)
        5. [Argument Options](./06_0_Functions_Subroutines.md#argument-options)
            1. [Optional Args](./06_0_Functions_Subroutines.md#optional-fucntion-args)
            2. [Keyword Args](./06_0_Functions_Subroutines.md#keyword-function-args)
            3. [Passing Args as Values](./06_0_Functions_Subroutines.md#passing-args-as-values)
            4. [Functions as Args](./06_0_Functions_Subroutines.md#passing-functions-as-arguments)
        6. [Recursive Functions](./06_0_Functions_Subroutines.md#recursive-function)
        7. [SAVE ing variables !WARNING](./06_0_Functions_Subroutines.md#save-variables-warning)
        8. [Pure Functions](./06_0_Functions_Subroutines.md#pure-functions)
            1. [Elemental Functions](./06_0_Functions_Subroutines.md#elemental-functions)
        9. [Assumed Rank Arguments](./06_0_Functions_Subroutines.md#assumed-rank-arguments)
    2. [Modules](./06_1_Modules.md)
        1. [Internal Functions and Subroutines](./06_1_Modules.md#internal-functions-and-subroutines)
        2. [External Modules](./06_1_Modules.md#external-modules)
            1. [Compiling Notes](./06_1_Modules.md#compiling)
            2. [Public and Private Data](./06_1_Modules.md#private-and-public-data)
            3. [Use options](./06_1_Modules.md#use-options)
        3. [Archive Files](./06_1_Modules.md#multiple-modules-in-an-archive-file)
    3. [Overloading](./06_2_Overloading.md)
        1. [Procedure Overloading](./06_2_Overloading.md#procedure-overloading)
        2. [Operator Overloading](./06_2_Overloading.md#operator-overloading)
    4. [Command Line Arguments](./06_3_Command_Line_Args.md)
        1. [Basics](./06_3_Command_Line_Args.md#basics)
        2. [Example](./06_3_Command_Line_Args.md#example)
7. [Memory Management](./07_1_Memory_Management.md)
    1. [Arrays and Pointers](./07_1_Memory_Management.md)
        1. [Allocatable Arrays](./07_1_Memory_Management.md#allocatable-arrays)
            1. [Assumed Shape and Automatic Arrays](./07_1_Memory_Management.md#assumed-shape-and-automatic-array)
        2. [Pointers](./07_1_Memory_Management.md#pointers)
    2. [Memory Layout](./07_2_Memory_Layout.md)
        1. [AoS and SoA Forms](./07_2_Memory_Layout.md#aos-and-soa-forms)
            1. [Example Transformation](./07_2_Memory_Layout.md#example-transformation)
8. [Derived Types](./08_1_Derived_Types.md)
    1. [Basics](./08_1_Derived_Types.md)
        1. [Derived Types](./08_1_Derived_Types.md#basics)
        2. [Extending Types](./08_1_Derived_Types.md#extending-types)
        3. [Linked List with Der. Type Example](../08_1_Derived_Types/Exercise3/ex3.f90)
    2. [Parameterised Derived Types](./08_2_Parameterised_D_Types.md)
        1. [Basics](./08_2_Parameterised_D_Types.md#basics)
        2. [Assumed and Deffered Lengths](./08_2_Parameterised_D_Types.md#assumed-and-deffered-lengths)
        3. [Extending PD Types](./08_2_Parameterised_D_Types.md#extending-pd-types)
9. [Modules](./06_1_Modules.md) in notes at [6.2](./06_1_Modules.md)
10. [Excpetion Handling](./10_Exception_Handling.md)
    1. [IEEE Standard](./10_Exception_Handling.md#ieee-standard)
    2. [IEEE Arithmetic](./10_Exception_Handling.md#ieee-arithmetic)
    3. [IEEE Exceptions](./10_Exception_Handling.md#ieee-exceptions)
        1. [Ex: Divide by Zero](./10_Exception_Handling.md#example-division-by-zero)
        2. [Ex: Overflow](./10_Exception_Handling.md#example-overflow)
11. [Object Orientated Programming](./11_OOP.md)
    1. [Basics](./11_OOP.md#basics)
    2. [Overloading Operators](./11_OOP.md#overloading-operators)
    3. [Extended Class Types](./11_OOP.md#extended-class-types)
    4. [Abstract Types](./11_OOP.md#abstract-types)
    5. [Type Guarding](./11_OOP.md#type-guarding)
12. [lrz course examples](./12_lrz_course.md)
13. [Doxygen](./13_Doxygen.md) - [Examples](../13_Doxygen/)  
    1. [Quick Start](./13_Doxygen.md#quick-start)
    2. [Config File](./13_Doxygen.md#config-file)
    3. [Doxygen Comments](./13_Doxygen.md#doxygen-comments)
    4. [Links](./13_Doxygen.md#links)
14. [Coarrays](./14_Coarrays.md)
    1. [Basics](./14_Coarrays.md#basics)
    2. [Ex: Monte Carlo Pi](./14_Coarrays.md#ex-monte-carlo-pi)
    3. [Links](./14_Coarrays.md#links)

---

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

[cla_args_test.f90](../06_Functions_Subroutines/CLAs/cla_args_test.f90) - Command line arguments  
[Fibonacci Ex](../06_Functions_Subroutines/Fibonacci/recur_vs_iter.f90) - Recursion vs Iteration **TIMING**

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

[ex1](../11_OOP/Exercise1/ex1.f90) - Example of arrays held in 2D array, **creating 2D cartesian grid**  
**[ex2](../11_OOP/Exercise2/ex2.f90)** - FULL formatted class, extended class, overloaded assignment, getter functions
