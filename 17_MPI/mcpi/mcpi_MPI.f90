! Monte Carlo Calculation of Pi using 1 Billion trials
!
! Compile:
! mpif90 mcpi_MPI.f90 -o mcpi_MPI
! mpiifort not tested
! mpiifort mcpi_MPI.f90 -o mcpi_MPI
!
! exec is MPI standard, run is not
! mpiexec --oversubscribe -n 10 ./mcpi_MPI
! wraps mpiexec
! mpirun --oversubscribe -np 10 ./mcpi_MPI
!
! Output:
! Computing Pi using        10 processes
! Elapsed time in seconds:    3.61615014    
! Trials:                     1000000000
! Pi:                 3.1416464519999998     
! Diff:          5.3798410206695735E-005

program mcpi_MPI

    use            :: mpi_f08
    use, intrinsic :: iso_fortran_env, only: int64, real64
    implicit none

    real(kind=real64)   :: Pi, internal_Pi
    real(kind=real64)   :: x, y
    real(kind=real64)   :: process_total, total

    integer(kind=int64) :: i
    integer(kind=int64) :: num_trials
    integer(kind=int64) :: this_process_num_trials

    integer :: ierror
    integer :: rank
    integer :: number_of_processes

    real    :: start_t, end_t, exec_time
    call cpu_time(start_t)

    call MPI_Init(ierror)
    call MPI_Comm_size( MPI_COMM_WORLD, number_of_processes, ierror )
    call MPI_Comm_rank( MPI_COMM_WORLD, rank, ierror )

    num_trials = 1000000000
    ! num_trials = 10

    if ( rank == 0 ) then
        ! num_trials must be divisible by num_images()
        if ( mod( num_trials, number_of_processes ) /= 0_int64 ) then
            error stop 'num_trials not evenly divisible by number of processes'
        end if
        print *, 'Computing Pi using ', number_of_processes, ' processes'
        call cpu_time(start_t)
        this_process_num_trials = num_trials/number_of_processes
    end if

    call MPI_Bcast( this_process_num_trials, 1, MPI_INTEGER, 0, &
                    MPI_COMM_WORLD, ierror )

    process_total = 0
    do i = 1_int64, this_process_num_trials
        call random_number(x)
        call random_number(y)
        if ( (x**2 + y**2) <= 1.0_real64 ) then
            process_total = process_total + 1.0_real64
        end if
    end do

    call MPI_Reduce( process_total, total, 1, MPI_DOUBLE_PRECISION, &
                     MPI_SUM, 0, MPI_COMM_WORLD, ierror )

    if ( rank == 0 ) then

        Pi = 4.0_real64 * total / real(num_trials, real64)

        call cpu_time(end_t)
        exec_time = (end_t - start_t)
        write (*,*) 'Elapsed time in seconds: ', exec_time

        print *, 'Trials:          ', num_trials
        print *, 'Pi:              ', Pi

        internal_Pi= 4.0_real64*atan(1.0_real64)
        print *, 'Diff:       ', Pi - internal_Pi

    end if

    call MPI_Finalize(ierror)
    
end program mcpi_MPI
