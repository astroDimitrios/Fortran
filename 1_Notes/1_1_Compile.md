# Compile

For compiling function modules and libraries see ***6_1_Func_Modules.md***.

`gfortran -o myprogram myprogram.f`    
`./myprogram`

From <https://mesoscale.agron.iastate.edu/fortran/compile.htm> 

Requires f90 ext     
`ifort -o ex3 ex3.f90`


## Extra Options

`-g` flag for debug info     
`-0` flag for optimisation (default normally, can be `-02` or `-03`)    
Warnings for risky code:

- GFortran `-Wall`
- IFort `-warn all`

Run-time error check, **slow**:

- GFortran `-fcheck=all`
- IFort `-check all`

Show backtrace to see where error occured:

- GFortran `-fbacktrace`
- IFort `-backtrace`

From https://masuday.github.io/fortran_tutorial/compilerfeatures.html