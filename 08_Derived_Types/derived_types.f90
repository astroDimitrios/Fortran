! Notes from reading the Holcombe pdf

program derived_types
    implicit none

    ! f2003 to use allocatables in derived types
    ! char(len(=*)) not allowed
    type grid
        integer                         :: nx, ny, nz ! element
        real, allocatable, dimension(:) :: x, y, z
    end type grid

    ! construct
    type(grid) xyz_grid
    ! array of grid types
    ! type(grid), dimension(3) :: grids

    integer :: n

    ! access element
    xyz_grid%nx = n

    allocate( xyz_grid%x(n), xyz_grid%y(n), xyz_grid%z(n) )
    
end program derived_types