! Compile:
! mpif90 MPI1.f90 -o MPI1
!
! Run:
! exec is MPI standard, run is not
! mpiexec -n 4 ./MPI1
! wraps mpiexec
! mpirun -np 4 ./MPI1
!
! Output:
! Hello            0  out of            4
! Hello            2  out of            4
! Hello            1  out of            4
! Hello            3  out of            4

program MPI1
    use :: mpi_f08
    implicit none

    integer :: ierror
    integer :: rank
    integer :: number_of_processes

    ! must start with these - they would not go into a module
    ! Start MPI
    call MPI_Init(ierror)
    ! Number of processes
    call MPI_Comm_size( MPI_COMM_WORLD, number_of_processes, ierror )
    ! Rank of individual process
    call MPI_Comm_rank( MPI_COMM_WORLD, rank, ierror )

    print *, 'Hello ', rank, ' out of ', number_of_processes

    ! must end with this
    call MPI_Finalize(ierror)

end program MPI1
