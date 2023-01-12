! Computes the 50th Fibonacci Number
! by recursion then iteration - 12,586,269,025
!
! Compile:
! gfortran -c constants_mod.f90 
! gfortran -c recur_vs_iter.f90 
! gfortran -o recur_vs_iter recur_vs_iter.o constants_mod.o
! ./recur_vs_iter
!
! Output:
! Recursion          12586269025
! Elapsed time in seconds:    126.890984    
! Iteration          12586269025
! Elapsed time in seconds:    4.00003046E-06
!
! Iteration is ~ 31 million times faster

program recur_vs_iter

    use constants_mod, only: i_64
    implicit none

    integer(kind=i_64), parameter :: x = 50

    integer(kind=i_64) :: fib_recur, fib_iter
    real               :: start_t, end_t, exec_time

    ! call cpu_time(start_t)
    ! fib_recur = fib_recursive(x)
    ! call cpu_time(end_t)
    ! write (*,*) 'Recursion', fib_recur
    ! exec_time = (end_t - start_t)
    ! write (*,*) 'Elapsed time in seconds: ', exec_time

    call cpu_time(start_t)
    fib_iter = fib_iterative(x)
    call cpu_time(end_t)
    write (*,*) 'Iteration', fib_iter
    exec_time = (end_t - start_t)
    write (*,*) 'Elapsed time in seconds: ', exec_time

contains

    recursive function fib_recursive(n) result(fib)
        integer(kind=i_64), intent(in) :: n
        integer(kind=i_64)             :: fib

        select case ( n )
            case ( 0 )
                fib = 0_i_64
            case ( 1 )
                fib = 1_i_64
            case default
                fib = fib_recursive(n-1_i_64) + fib_recursive(n-2_i_64)
        end select
    end function fib_recursive

    function fib_iterative(n) result(fib)
        integer(kind=i_64), intent(in) :: n
        integer(kind=i_64)             :: fib
        
        integer            :: i
        integer(kind=i_64) :: back_2, back_1

        back_2 = 0_i_64
        back_1 = 1_i_64
        fib    = 0_i_64

        select case ( n )
            case ( 0 )
                return
            case default
                do i = 1, n
                    back_2 = back_1
                    back_1 = fib
                    fib    = back_2 + back_1
                end do
        end select

    end function fib_iterative
    
end program recur_vs_iter