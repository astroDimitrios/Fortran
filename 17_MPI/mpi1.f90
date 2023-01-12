! Compile:
! mpif90 mpi1.f90 -o mpi1
!
! Run:
! exec is MPI standard, run is not
! mpiexec -n 4 ./mpi1
! wraps mpiexec
! mpirun -np 4 ./mpi1
!
! Output:
! Hello            0  out of            4
! Hello            2  out of            4
! Hello            1  out of            4
! Hello            3  out of            4

program mpi1
    use :: mpi_f08
    implicit none

    integer :: ierror
    integer :: rank
    integer :: number_of_processes

    ! must start with these
    ! Start MPI
    call mpi_init(ierror)
    ! Number of processes
    call mpi_comm_size( mpi_comm_world, number_of_processes, ierror )
    ! Rank of individual process
    call mpi_comm_rank( mpi_comm_world, rank, ierror )

    print *, 'Hello ', rank, ' out of ', number_of_processes

    ! must end with this
    call mpi_finalize(ierror)

end program mpi1
