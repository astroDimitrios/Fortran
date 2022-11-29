program derived_types
    implicit none

    ! F2003 to use allocatables in derived types
    ! char(len(=*)) not allowed
    TYPE grid
        INTEGER :: nx, ny, nz ! element
        REAL, ALLOCATABLE, DIMENSION(:) :: x, y, z
    END TYPE grid

    ! construct
    TYPE(grid) xyz_grid
    ! array of grid types
    ! TYPE(grid), dimension(3) :: grids

    integer :: N

    ! access element
    xyz_grid%nx = N

    allocate(xyz_grid%x(N), xyz_grid%y(N), xyz_grid%z(N))
    
end program derived_types