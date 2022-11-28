! Write a subroutine with two mandatory and two optional arguments.
! Assign a default value to one of the optional arguments.
! Test whether the optional arguments are passed
! and perform some operations if they are.
! Write a calling program that exercises all possibilities
! for calling this subroutine.

program arg_test

    implicit none

    real    :: x, y, p
    logical :: magic

    y = 20.
    p = 0.4
    magic = .true.

    call math_magic(x, y)
    write (*, *) x

    call math_magic(x, y, p)
    write (*, *) x

    call math_magic(x, y, p, magic)
    write (*, *) x

    call math_magic(x, y, magic=magic)
    write (*, *) x

contains

    subroutine math_magic(x, y, p, magic)
        real              :: x, y 
        real, optional    :: p
        logical, optional :: magic
        real              :: default_p = 12

        if (present(p)) then 
            x = y*p
        else
            x = y*default_p
        end if

        if (present(magic)) then
            if (magic.eqv..true.) then
                write (*, '(A)') "Magic = https://www.google.com/url?sa"//&
                "=t&rct=j&q=&esrc=s&source=web&cd=&cad="//&
                "rja&uact=8&ved=2ahUKEwiQ7IDRrNH7AhUTQk"//&
                "EAHeVwAKkQwqsBegQIGxAB&url=https%3A%2F"//&
                "%2Fwww.youtube.com%2Fwatch%3Fv%3DU_ZHs"//&
                "k0-eF0&usg=AOvVaw22pj3Oe16isyhuf5o4fWk5"
            end if
        end if
 
    end subroutine

end program