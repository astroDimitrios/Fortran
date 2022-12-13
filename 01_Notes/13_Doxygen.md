# Doxygen

Ver 1.9.5 (conda-forge)
https://www.doxygen.nl/

> Directory [link](../13_Doxygen/).

1.
doxygen -g
(gen default file)

2.
Edit default
https://aaronbloomfield.github.io/pdr/tutorials/11-doxygen/index.html

The GENERATE_LATEX option (line 1,543): change YES to NO. We want HTML output (which is already set to yes), but we don’t want LaTeX output.

Mine 1830

The EXTRACT_ALL option (line 401): set to YES. This will cause Doxygen to create documentation for all the members in our file, including our average() function.

Mine 492

The OUTPUT_DIRECTORY option (line 61): set to doc/. This will cause all the created files to be in the doc/ sub-directory, and this is necessary for us to find your files.

Mine 71

Line 45 project name

809 to YES for quiet messages

3.
doxygen Doxyfile

---

> Call Graphs
>
> Doxygen can create call graphs for your code. We are going to change three options to YES: HAVE_DOT (line 2,052), CALL_GRAPH (line 2,168), and CALLER_GRAPH (line 2,179). The first one turns on graph creation (“dot” is the command-line for the graphviz package); the second and third turn on specific types of graphs.

---

https://www.doxygen.nl/manual/docblocks.html#fortranblocks

OPTIMIZE_FOR_FORTRAN   = YES
EXTENSION_MAPPING      = f=FortranFixed f90=FortranFree
