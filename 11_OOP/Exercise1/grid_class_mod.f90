! Write a class module that describes a grid for a numerical algorithm.
! The grid should be two dimensional (x,y).
!
! The object should include a definition of the grid type
! that includes variables for the number of points in each dimension,
! the numerical coordinates of the first and last points in
! each dimension, and the distance delta x, delta y
! between each point in each dimension
! (assumed constant, but could differ between x and y).
!
! The object should contain methods that create the grid,
! compute delta x and delta y, and multiply the number of grid points
! in each dimension by some factor with a corresponding
! change to delta x and delta y.
!
! Overload the assignment operator to copy a grid to another grid.
! Write a main program that uses the object.

module grid_class_mod

    implicit none
    private

    public grid_2D

    ! min size 2 by 2
    ! lbounds in lower left corner
    ! grid is a 2 by 2 matrix minimum
    ! each element has a (1, 2) array of (x, y) coords
    type grid_2D
        private
        integer :: total_cell_num
        integer :: num_cells(2)   ! num cells in x, y dim
        real    :: bounds(2,2)    ! bounds low, up columns; x, y rows
        real    :: delta(2)       ! delta x and delta y between cells
        
        real, allocatable, public :: grid(:,:,:) ! call create_grid to create grid
    contains
        private 
        procedure, public :: create_grid
        procedure, public :: scale_cells
        procedure         :: compute_delta
        procedure         :: equate_grid
        generic, public   :: assignment(=) => equate_grid
        final             :: destroy_grid
    end type grid_2D

    interface grid_2D
        module procedure init_grid
    end interface grid_2D

contains

    function init_grid( num_cells, bounds ) result(new_grid)
        implicit none
        integer       :: num_cells(2) 
        real          :: bounds(2,2)
        type(grid_2D) :: new_grid

        if ( any(num_cells < 2) ) then
            error stop 'Cell Number cannot be < 2 in any dimension'
        else if ( any( (bounds(:,2) - bounds(:,1)) < 0) ) then
            error stop 'Upper bound must be greater than lower bound'
        end if

        new_grid%num_cells = num_cells
        new_grid%total_cell_num = num_cells(1) * num_cells(2)
        new_grid%bounds = bounds

        call compute_delta(new_grid)

    end function init_grid

    subroutine compute_delta(self)
        implicit none
        class(grid_2D), intent(inout) :: self
        integer                       :: i

        do i = 1, 2
            self%delta(i) = ( self%bounds(i,2) - self%bounds(i,1) ) / &
                            ( self%num_cells(i) - 1 )
        end do

    end subroutine compute_delta

    subroutine create_grid(self)
        implicit none
        class(grid_2D), intent(inout) :: self
        integer                       :: i, j
        real                          :: i_val, j_val
        
        allocate( self%grid( self%num_cells(1), self%num_cells(2), 2 ) )
        do j = 1, self%num_cells(2)
            do i = 1, self%num_cells(1)
                i_val = self%bounds(1,1) + (j-1) * self%delta(1)
                j_val = self%bounds(2,2) - (i-1) * self%delta(1)
                self%grid(i, j, :) = [i_val, j_val]
            end do
        end do

    end subroutine create_grid

    subroutine scale_cells(self, scale)
        implicit none
        class(grid_2D), intent(inout) :: self
        real, intent(in)              :: scale
        integer                       :: new_num_cells(2)

        new_num_cells = self%num_cells * scale

        if ( mod(scale, 0.25) /= 0 ) then
            write (*,*) 'Did you check your scale?'
        else if ( any(new_num_cells < 2) ) then
            error stop 'New Cell Number cannot be < 2 in any dimension'
        end if

        self%num_cells = new_num_cells
        self%total_cell_num = new_num_cells(1) * new_num_cells(2)

        call compute_delta(self)

        if ( allocated(self%grid) ) then
            deallocate(self%grid)
            call create_grid(self)
        end if
        
    end subroutine scale_cells

    subroutine equate_grid( lhs_grid, rhs_grid )
        class(grid_2D), intent(in)  :: rhs_grid
        class(grid_2D), intent(out) :: lhs_grid

        lhs_grid%total_cell_num = rhs_grid%total_cell_num
        lhs_grid%num_cells = rhs_grid%num_cells
        lhs_grid%bounds = rhs_grid%bounds
        lhs_grid%delta = rhs_grid%delta

        if ( allocated(rhs_grid%grid) ) then
            allocate( lhs_grid%grid( lhs_grid%num_cells(1), &
                                     lhs_grid%num_cells(2), 2 ) )
        end if

    end subroutine equate_grid

    subroutine destroy_grid(self)
        implicit none
        type(grid_2D) :: self

        if ( allocated(self%grid) ) deallocate( self%grid )

    end subroutine destroy_grid

end module grid_class_mod