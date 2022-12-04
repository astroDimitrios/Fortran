program float_comp

    use, intrinsic :: iso_fortran_env
    implicit none

    integer, parameter :: sp = REAL32
    real(sp)           :: x = 1.0

    print *, epsilon(x)
    print *, huge(x)
    print *, tiny(x)

end program float_comp