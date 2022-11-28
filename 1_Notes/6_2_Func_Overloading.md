# Function Overloading

```fortran
interface f
    function f_i(x)
        integer :: x
    end function
    function f_r(x)
        real    :: x
    end function
end interface
```

The function `f` can be used with integers or real values. The compiler will chose which to use when compiling. Full example on [wikibooks](https://en.wikibooks.org/wiki/Fortran/language_extensions).

Also consult the wikibook for overloading operators etc.