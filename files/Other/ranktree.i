 %module ranktree
 %{
 /* Includes the header in the wrapper code */
 #define SWIG_FILE_WITH_INIT
 #include "ranktree.h"
 %}
%include "numpy.i"
 
%init %{
     import_array();
 %}

%apply (int DIM1, double* IN_ARRAY1) {(int len1, double* s), (int len2, double* f )}
%apply (int DIM1, int* IN_ARRAY1) {(int len3, int* o)}
%apply (int* ARGOUT_ARRAY1, int DIM1) {(int* returnvec, int len4)}


 /* Parse the header file to generate wrappers */
 %include "ranktree.h"
