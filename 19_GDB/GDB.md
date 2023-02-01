# GDB

***Need to test with updated version of GDB** vdi env not working

Test file

```console
gfortran -fopenmp -o run_mandelbrot mandelbrot.f90 -ggdb
```

Debugging <https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html>

## Start / Exit

```console
gdb
```

```console
quit
exit
```

or `ctrl-d`

## Breakpoint

```console
break location
```

Set a breakpoint at the given location, which can specify a function name, a line number, or an address of an instruction.
