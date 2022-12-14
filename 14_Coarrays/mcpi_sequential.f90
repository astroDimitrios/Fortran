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

    real(kind=real64)   :: Pi 
    real(kind=real64)   :: x, y
    real(kind=real64)   :: total

    integer(kind=int64) :: i
    integer(kind=int64) :: num_trials

    real                :: startT, endT, execTime
    call cpu_time(startT)

    num_trials = 1000000000

    do i = 1_int64, num_trials
        call random_number(x)
        call random_number(y)
        if ( (x**2 + y**2) <= 1.0_real64 ) total = total + 1.0_real64
    end do

    Pi = 4.0_real64 * total / real(num_trials, real64)

    call cpu_time(endT)
    execTime = (endT - startT)
    write (*,*) 'Elapsed time in seconds: ', execTime

    print *, 'Trials:       ', num_trials
    print *, 'Pi:              ', Pi
    
end program mcpi_sequential

