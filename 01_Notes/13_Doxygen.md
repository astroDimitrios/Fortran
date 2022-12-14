# Doxygen

Notes made with [Doxygen](https://www.doxygen.nl/) Ver 1.9.5 (conda-forge)

> Directory [link](../13_Doxygen/). Small [example](../13_Doxygen/Example/), larger bird class [example](../13_Doxygen/Bird_OOP_Ex2).    
> **NOTE:** Docs files not tracked, generate them yourself. See Quick Start point 3.

## Contents

1. [Quick Start](#1)
2. [Config File](#2)
3. [Doxygen Comments](#3)
4. [Links](#4)

<a name="1"></a>
# Quick Start

Once Doxygen is installed:

1. Generate a default config file:     
    `$ doxygen -g`

2. Edit the defaults:     
    `PROJECT_NAME`     set to `name`       
    `OUTPUT_DIRECTORY` set to `doc/`    
    `QUIET_MESSAGES`   set to `YES`  
    `GENERATE_LATEX`   set to `NO`   

    [Fortran Specifics](https://www.doxygen.nl/manual/docblocks.html#fortranblocks):    
    `OPTIMIZE_FOR_FORTRAN   = YES`    
    `EXTENSION_MAPPING      = f=FortranFixed f90=FortranFree`

3. Create the docs using the config file:    
    `$ doxygen Doxyfile`

<br></br>
<a name="2"></a>
# Config File

You have already edited the default config to supress messages, specify the output directory etc. These are some other options to think about changing:

`PROJECT_NUMBER`

Could set to `YES`:    
`SOURCE_BROWSER` - Gen. a list of all source files      
`INLINE_SOURCES` - Inlcude body of classes, functions etc. in docs     
`INLINE_INHERITED_MEMB` - Show all inherited members of a class      
`EXTRACT_ALL` - Extract all entities whether they are documented or not    
`EXTRACT_PRIVATE` - Extract private members     
`WARN_NO_PARAMDOC` - Warnings if parameters are not documented, disabled by `EXTRACT_ALL`    
`GENERATE_TREEVIEW` - Generate a TOC/index view on the left

## Call Graphs

> Doxygen can create call graphs for your code. We are going to change three options to `YES`: `HAVE_DOT`, `CALL_GRAPH`, and `CALLER_GRAPH`. The first one turns on graph creation (“dot” is the command-line for the graphviz package); the second and third turn on specific types of graphs.
>
> [Using Doxygen: Quick Guide, Jignesh M. Patel](https://pages.cs.wisc.edu/~jignesh/cs564/notes/Doxygen.pdf)

[Example](../13_Doxygen/Bird_OOP_Ex2) with these set to `YES`.

<br></br>
<a name="3"></a>
# Doxygen Comments

Example file comments:
```fortran
!> @file
!> @author  Dimitrios Theodorakis
!> @version 1.0
!> 
!> @section DESCRIPTION
!> 
!> Program implementing my own **hyperbolic cosine** function
!>
!> @note    This was from an activity in Scientific Programming
!>          in Fortran 2003 by Katherine Holcomb
```

Example function comments:
```fortran
!> @brief   Computes the hyperbolic cosine of a complex variable.
!> @author  Dimitrios Theodorakis
!> @details My own implementation of the hyperbolic cosine
!>          function using cosh(z) = 0.5*(e**z + e**-z).
!>
!> @return  Returns hyp cosine as a complex variable.
!> @param[in] x (in) Complex variable
!>
!> @note    FORTRAN <3
!> @todo    Need to ensure numerical accuracy.
!> @warning Just use the intrinsic function!

function my_cosh(x) result(y)
    complex, intent (in)  :: x
    complex               :: y !< Complex output

    y = 0.5_r_native * ( exp(x) + exp(-x) )
end function my_cosh
```

`#variable` - if Doxygen is set to create docs for class member variables, the `#` generates a link to the doc. Default is not for private members.

OR:

```fortran
!> toucan            - auto linked to toucan class
!> file.txt          - auto linked to file
!> toucan::diet_food - linked to private member
```

See more on autolinking [here](https://www.star.bnl.gov/public/comp/sofi/doxygen/autolink.html).

Descriptions supports markdown!

## License

Not all files will need a Doxygen license comment. Use this instead:
```fortran
!-------------------------------------
! (c) Copyright GNU Public, GPL-3.0
!-------------------------------------
```
Doxygen version:
```fortran
!> @section LICENSE
!> 
!> GNU Public, GPL-3.0-or-later
```
## Grouping

Adding
```fortran
!> @defgroup const Constants
!> @{
!> @name Numerical constants
!> @{
... code ...
!> @}
!> @}
```

Makes Constants appear under Modules on the documents website in an easy to read format. Full details of member variables, functions etc. are still available under the second Modules (with a dropdown) option.

You can group statements using just `@name` if you don't want to define a goup.

See ***[constants_mod.f90](../13_Doxygen/Example/constants_mod.f90)***.

<br></br>
<a name="4"></a>
# Links

- Doxygen Website, https://www.doxygen.nl/
- Doxygen Fortran Blocks, https://www.doxygen.nl/manual/docblocks.html#fortranblocks
- Using Doxygen: Quick Guide, Jignesh M. Patel, https://pages.cs.wisc.edu/~jignesh/cs564/notes/Doxygen.pdf
- Introduction to Doxygen, John's Basement, https://www.youtube.com/watch?v=5G1zUpNFmEY