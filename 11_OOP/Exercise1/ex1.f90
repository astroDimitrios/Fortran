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
!
! Compile
! gfortran -c grid_class_mod.f90 
! gfortran -c ex1.f90
! gfortran -o ex1 ex1.o grid_class_mod.o
! ./ex1

program grid_test

    use grid_class_mod, only: grid_2D
    implicit none

    ! Writing matrix properly to screen
    ! From - https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html
    interface
        subroutine write_matrix(x)
            real :: x(:,:,:)
        end subroutine write_matrix
    end interface

    integer       :: num_cells(2)
    real          :: bounds(2,2)
    type(grid_2D) :: grid_2D_1, grid_2D_2

    ! test basic member assignment
    num_cells = [ 2, 2 ]
    bounds    = transpose(reshape( [0, 10, 0, 10], shape(bounds) ))
    grid_2D_1 = grid_2D(num_cells, bounds)

    ! test creating the allocatable grid
    call grid_2D_1%create_grid
    call write_matrix(grid_2D_1%grid)

    ! test overloaded assignment operator
    grid_2D_2 = grid_2D_1
    ! test scaling
    call grid_2D_2%scale_cells(2.0)

    ! double .5 call fails correctly
    ! call grid_2D_2%scale_cells(.5)
    ! call grid_2D_2%scale_cells(.5) fails

    call write_matrix(grid_2D_2%grid)
    
end program grid_test

subroutine write_matrix(x)
    real :: x(:,:,:)
    write (*,*)
    
    do i = lbound(x,1), ubound(x,1)
       write (*,*) '[', ( x(i,j,:), j = lbound(x,2), ubound(x,2) ), ']'
    end do
end subroutine write_matrix