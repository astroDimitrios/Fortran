! Monte Carlo Calculation of Pi using 1 Billion trials
!
! Compile:
! ifort -o mcpi_sequential mcpi_sequential.f90
! ./mcpi_sequential 
!
! Output:
! Elapsed time in seconds:    32.32173    
! Trials:                   1000000000
! Pi:                 3.14156861600000

program mcpi_sequential

    use, intrinsic :: iso_fortran_env, only: int64, real64
    implicit none

    real(kind=real64)   :: Pi, internal_Pi 
    real(kind=real64)   :: x, y
    real(kind=real64)   :: total

    integer(kind=int64) :: i
    integer(kind=int64) :: num_trials

    integer(kind=int64) :: start_t, end_t, count_rate
    real(kind=real64)   :: exec_time

    call system_clock(start_t, count_rate)

    num_trials = 1000000000

    total = 0
    do i = 1_int64, num_trials
        call random_number(x)
        call random_number(y)
        if ( (x**2 + y**2) <= 1.0_real64 ) total = total + 1.0_real64
    end do

    Pi = 4.0_real64 * total / real(num_trials, real64)

    call system_clock(end_t, count_rate)
    exec_time = real( end_t - start_t ) / real( count_rate )
    write (*,*) 'Elapsed time in seconds: ', exec_time

    print *, 'Trials:       ', num_trials
    print *, 'Pi:              ', Pi

    internal_Pi= 4.0_real64*atan(1.0_real64)
    print *, 'Diff:       ', Pi - internal_Pi
    
end program mcpi_sequential
