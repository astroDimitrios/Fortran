! Compile:
! mpif90 MPI2.f90 -o MPI2
!
! Run:
! exec is MPI standard, run is not
! mpiexec -n 4 ./MPI2
! wraps mpiexec
! mpirun -np 4 ./MPI2
!
! Output:
! Process 0 receiving messages:
! Hello from process:            1
! Hello from process:            2
! Hello from process:            3

program MPI2
    use :: mpi_f08
    implicit none

    integer :: ierror
    integer :: rank
    integer :: number_of_processes
    type(mpi_status) :: mpistatus

    integer :: i

    ! must start with these - they would not go into a module
    ! Start MPI
    call MPI_Init(ierror)
    ! Number of processes
    call MPI_Comm_size( MPI_COMM_WORLD, number_of_processes, ierror )
    ! Rank of individual process
    call MPI_Comm_rank( MPI_COMM_WORLD, rank, ierror )

    if ( rank == 0 ) then
        print *, 'Process 0 receiving messages:'
        do i = 1, number_of_processes - 1
            call MPI_Recv( rank, 1, MPI_INTEGER, i, 0, MPI_COMM_WORLD, &
                           mpistatus, ierror )
            if ( ierror == MPI_SUCCESS ) then
                print *, 'Hello from process: ', rank
            else 
                error stop 'MPI fail'
            end if
        end do
    else
        call MPI_Send( rank, 1, MPI_INTEGER, 0, 0, MPI_COMM_WORLD, ierror )
    end if

    ! must end with this
    call MPI_Finalize(ierror)

end program MPI2
