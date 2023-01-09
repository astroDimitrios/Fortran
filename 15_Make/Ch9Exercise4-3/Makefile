###############################################################################
# License: CC-BY-SA-NC
# Author:
###############################################################################
# Ice Cream Makefile
###############################################################################
.POSIX:
.SUFFIXES:
.NOTPARALLEL:

FC := gfortran
FFLAGS := -O3 -std=f2008

PROJECT_NAME := ice_cream
PROJECT_DIR := ./bin
BUILD_DIR := ./build
SRC_DIR := ./source

# Find all sources in SRC_DIR
# ./source/modules/ice_cream_mod.f90 ./source/ex4.f90
SRCS := $(shell find $(SRC_DIR) -name '*.f90')
# Create .o filepaths for all sources 
# ./build/modules/ice_cream_mod.o ./build/ex4.o
OBJS:= $(patsubst $(SRC_DIR)/%,$(BUILD_DIR)/%,$(SRCS:.f90=.o))

# Get all the directories in SRC_DIR (and itself)
# ./source/modules/ ./source/
SRC_DIRS := $(dir $(SRCS))
# Create same subdirectories in BUILD_DIR
# ./build/modules/ ./build/
OUT_DIRS := $(patsubst $(SRC_DIR)/%,$(BUILD_DIR)/%,$(SRC_DIRS))

# make all .mod files go to a hidden dir in BUILD_DIR
# from - https://aoterodelaroza.github.io/devnotes/modern-fortran-makefiles/
MODDIR := $(BUILD_DIR)/.mod
ifneq ($(MODDIR),)
  $(shell test -d $(MODDIR) || mkdir -p $(MODDIR))
  FFLAGS+= -J $(MODDIR) # -module for ifort
endif


# Set default to run build and then clean
.PHONY: default
default: build clean

.SUFFIXES: .f90 .o .mod .smod
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 $(OUT_DIRS)
	$(FC) $(FFLAGS) -o $@ -c $<

$(OUT_DIRS):
	@mkdir -p $(dir $@)

###############################
# Build

.PHONY: build
build: $(OBJS)
	@mkdir -p $(PROJECT_DIR)
	$(FC) $(FFLAGS) -o $(PROJECT_DIR)/$(PROJECT_NAME) $^

# have both?
.PHONY: clean cleanall
cleanall: clean FORCE
	@rm -rf $(PROJECT_DIR)

clean: FORCE
	@rm -rf $(BUILD_DIR)

# same as using phony where it is not supported
# https://www.gnu.org/software/make/manual/html_node/Force-Targets.html
FORCE: