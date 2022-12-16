# Glossary

[Fortran Glossary](http://numat.net/fortran/fortgloss.html)

## Polymorphism

> In programming languages, a polymorphic object is an entity, such as a variable or a procedure, that can hold or operate on values of differing types during the program's execution. Because a polymorphic object can operate on a variety of values and types, it can also be used in a variety of programs, sometimes with little or no change by the programmer. The idea of write once, run many, also known as code reusability, is an important characteristic to the programming paradigm known as Object-Oriented Programming (OOP).
>
> [pgroup](https://www.pgroup.com/blogs/posts/f03-oop-part1.htm)

```fortran
subroutine add_balls(self, n)
    class(ice_cream), intent(inout) :: self
    integer, intent(in) :: n

    self%balls = self%balls + n
end subroutine add_balls
```

The `class(ice_cream)` makes this subroutine polymorphic. It can accept any type derived from the `ice_cream` class as the `self` argument, see full [code](../11_OOP/Example1/ice_cream_class.f90). If derived type specific variables are then type guarding with a `select type` construct can be used, see [here](./11_OOP.md#5).
