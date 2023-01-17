! Monte Carlo Calculation of Pi using 1 Billion trials
!
! Compile:
! gfortran -fopenmp mcpi_OpenMP.f90 -o mcpi_OpenMP
! or not working:
! ifort -qopenmp mcpi_OpenMP.f90 -o mcpi_OpenMP
! 
! OMP_NUM_THREADS=10 ./mcpi_OpenMP
!
! Output:
! Computing Pi using       10  processes
! Elapsed time in seconds:    8.16322803     
! Trials:                     1000000000
! Pi:                 3.1416070000000000     
! Diff:          1.4346410206922400E-005

program mcpi_OpenMP

    use, intrinsic :: omp_lib
    use, intrinsic :: iso_fortran_env, only: int64, real64
    implicit none

    real(kind=real64)   :: Pi, internal_Pi
    real(kind=real64)   :: x, y
    real(kind=real64)   :: total

    integer(kind=int64) :: i, j
    integer(kind=int64) :: num_trials
    integer(kind=int64) :: thread_num_trials

    integer :: number_of_threads

    integer(kind=int64) :: start_t, end_t, count_rate
    real(kind=real64)   :: exec_time

    call system_clock(start_t, count_rate)

    num_trials = 1000000000
    ! num_trials = 10
    number_of_threads = omp_get_max_threads()

    !$omp single
    if ( mod( num_trials, number_of_threads ) /= 0_int64 ) then
        error stop 'num_trials not evenly divisible by number of processes'
    end if
    print *, 'Computing Pi using ', number_of_threads, ' processes'
    thread_num_trials = num_trials / number_of_threads
    !$omp end single

    !$omp parallel default(none) shared(thread_num_trials) private(j, i, x, y) reduction(+:total)
    do i = 1_int64, thread_num_trials
        call random_number(x)
        call random_number(y)
        if ( (x**2 + y**2) <= 1.0_real64 ) then
            total = total + 1.0_real64
        end if
    end do
    !$omp end parallel

    Pi = 4.0_real64 * total / real(num_trials, real64)

    call system_clock(end_t, count_rate)
    exec_time = real( end_t - start_t ) / real( count_rate )
    write (*,*) 'Elapsed time in seconds: ', exec_time

    print *, 'Trials:          ', num_trials
    print *, 'Pi:              ', Pi

    internal_Pi= 4.0_real64*atan(1.0_real64)
    print *, 'Diff:       ', Pi - internal_Pi
    
end program mcpi_OpenMP
