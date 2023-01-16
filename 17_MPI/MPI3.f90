! Compile:
! mpif90 MPI3.f90 -o MPI3
!
! Run:
! exec is MPI standard, run is not
! mpiexec --oversubscribe -n 5 ./MPI3
! wraps mpiexec
! mpirun --oversubscribe -np 5 ./MPI3
!
! Output:
! Array to Scatter:    0.00000000       2.00000000       4.00000000       6.00000000       8.00000000    
! Hello from rank:            0  with start time =    0.00000000    
! Hello from rank:            1  with start time =    2.00000000    
! Hello from rank:            2  with start time =    4.00000000    
! Hello from rank:            3  with start time =    6.00000000    
! Hello from rank:            4  with start time =    8.00000000    
! Gathered Array:    2.00000000       4.00000000       6.00000000       8.00000000       10.0000000   

program MPI3

    use, intrinsic :: iso_fortran_env, only: int64, real64
    use :: mpi_f08
    implicit none

    integer :: ierror
    integer :: rank
    integer :: number_of_processes
    ! type(mpi_status) :: mpistatus

    real, parameter    :: time_start = 0
    real, parameter    :: time_end   = 10
    integer, parameter :: N_coarse   = 5
    real               :: Dt
    real               :: coarse_times(N_coarse)

    ! to receive
    real :: coarse_step_time_start
    ! to gather
    real :: next_coarse_step_time_start
    real :: gathered_coarse_times(N_coarse)

    integer :: i

    ! must start with these - they would not go into a module
    ! Start MPI
    call MPI_Init(ierror)
    ! Number of processes
    call MPI_Comm_size( MPI_COMM_WORLD, number_of_processes, ierror )
    ! Rank of individual process
    call MPI_Comm_rank( MPI_COMM_WORLD, rank, ierror )

    Dt = ( time_end - time_start ) / N_coarse
    coarse_times = [( i * Dt + time_start, i = 0, N_coarse-1 )]

    if ( rank == 0 ) then

        if ( N_coarse /= number_of_processes ) then
            error stop 'Number of coarse timesteps must equal the number of processes'
        end if

        print *, 'Array to Scatter: ', coarse_times

    end if

    call MPI_Barrier(MPI_COMM_WORLD)

    call MPI_Scatter( coarse_times, 1, MPI_REAL,           &
                      coarse_step_time_start, 1, MPI_REAL, &
                      0, MPI_COMM_WORLD, ierror)

    print *, 'Hello from rank: ', rank, &
             ' with start time = ', coarse_step_time_start

    ! add Dt to the time step to model doing something
    next_coarse_step_time_start = coarse_step_time_start + Dt

    call MPI_Barrier(MPI_COMM_WORLD)

    call MPI_Gather( next_coarse_step_time_start, 1, MPI_REAL, &
                     gathered_coarse_times, 1, MPI_REAL,       &
                     0, MPI_COMM_WORLD, ierror)

    call MPI_Barrier(MPI_COMM_WORLD)

    if ( rank == 0 ) then
        print *, 'Gathered Array: ', gathered_coarse_times
    end if

    ! must end with this
    call MPI_Finalize(ierror)

end program MPI3
