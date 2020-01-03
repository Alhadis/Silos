%module swig_vs

%{
#define SWIG_FILE_WITH_INIT
#include "no_args.h"
#include "fit_predict.h"
#include "nump.h"
%}

%include "numpy.i"
%init %{
import_array();
%}

// in 1D array
%apply (double* IN_ARRAY1, int DIM1) {(double* seq, int n)};
// in 2D array
%apply ( double* IN_ARRAY2, int DIM1, int DIM2 ){(double* seq, int n, int m)};
// out 1D array
%apply ( double* ARGOUT_ARRAY1, int DIM1) {(double *arr, int size)};

// in two 1D arrays
%apply (double* IN_ARRAY1, int DIM1) {(double* seq1, int n)};
%apply (double* IN_ARRAY1, int DIM1) {(double* seq2, int m)};

// in and out 1D array
%apply (double* IN_ARRAY1, int DIM1 ) {(double *inarr, int size)}; 
%apply (double* ARGOUT_ARRAY1, int DIM1) {(double *outarr, int size2)}; 

//TREE
// fit
%apply ( double* IN_ARRAY2, int DIM1, int DIM2 ){(double* input_array, int num_of_samples, int num_of_features)};
%apply (double* IN_ARRAY1, int DIM1) {(double* input_class, int num_of_samples2)};
// predict
%apply ( double* IN_ARRAY2, int DIM1, int DIM2 ){(double* input_array, int num_of_samples, int num_of_features)};
%apply (double* ARGOUT_ARRAY1, int DIM1) {(double *prediction, int size)};

%include stl.i
namespace std {
    %template(IntVector)    vector<int>;
    %template(DoubleVector) vector<double>;
}

%include "no_args.h"
%include "fit_predict.h"
%include "nump.h"