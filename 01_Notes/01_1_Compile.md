# Compile

For compiling function modules and libraries see ***[06_1_Func_Modules.md](./06_1_Func_Modules.md)***.

`gfortran -o myprogram myprogram.f`  
`./myprogram`

From [mesoscale.argon.iastate.edu](<https://mesoscale.agron.iastate.edu/fortran/compile.htm>)

Requires `.f90` ext to use ifort  
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

From [masuday.github.io](https://masuday.github.io/fortran_tutorial/compilerfeatures.html)

## Floating Point Exception Handling

With **IFORT**  
Divide by zero, over/underflow etc.

Use `-fpen` option:

`-fpe0` overflow, divide zero, invalid fp excep. Error message and abort. Underflow goes to 0.  
`-fpe1` No error messages, get NaNs and +-Infs. Underflow set to zero.  
`-fpe3` DEFAULT full exception behaviour. Underflow gradual - not necessarily 0.

See [here](http://astroa.physics.metu.edu.tr/MANUALS/intel_ifc/mergedProjects/bldaps_for/using_the_floating_point_exception_handling_(-fpe)_option.htm) for more and an example of these options. Better is to use the [IEEE Exceptions](./10_Exception_Handling.md).

[Divide by zero check](https://rosettacode.org/wiki/Detect_division_by_zero#Fortran) rosettacode.
