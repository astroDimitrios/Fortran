###############################################################################
# License: CC-BY-SA-NC
# Author:
###############################################################################
# Ice Cream Makefile
###############################################################################
.POSIX:
.SUFFIXES:

FC = gfortran
FFLAGS = -O3 -std=f2008

PROJECT_NAME = ice_cream
SRC = ice_cream_mod.f90 ice_cream.f90
OBJ = $(SRC:.f90=.o)

.PHONY: default
default: build clean

.SUFFIXES: .f90 .o
%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

###############################
# Build

.PHONY: build
build: $(OBJ)
	$(FC) $(FFLAGS) -o $(PROJECT_NAME) $(OBJ)

.PHONY: clean
clean:
	@rm -f *.mod *.o
