// mds_utils/python/ublas/numpy_array.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%include "mds_utils/python/common.i"
%include "mds_utils/python/obj.i"
%include "std_complex.i"

%header %{
#include <complex>
#include <mds_utils/python/ublas/numpy_array.hpp>

namespace ublas_convert = boost::numeric::ublas;
%}

%define NUMPY_ARRAY_IN_TYPEMAPS_GEN(type)

%typemap(in) ublas_convert::NumPy1DArray< type > = mds_utils::python::Obj;
%typemap(in) ublas_convert::NumPy1DArray< type >& (ublas_convert::NumPy1DArray< type > tmp) {
	try {
		tmp = $input;
		$1 = &tmp;
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}
%typemap(in) ublas_convert::NumPy1DArray< type >* = ublas_convert::NumPy1DArray< type >&;

%typecheck(SWIG_TYPECHECK_POINTER) ublas_convert::NumPy1DArray< type > {
  $1 = PyArray_Check($input);
}


%enddef

NUMPY_ARRAY_IN_TYPEMAPS_GEN(char)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(unsigned char)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(short)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(unsigned short)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(int)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(unsigned int)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(long)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(unsigned long)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(long long)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(unsigned long long)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(size_t)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(float)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(double)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(long double)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(std::complex<float>)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(std::complex<double>)
NUMPY_ARRAY_IN_TYPEMAPS_GEN(std::complex<long double>)


%define NUMPY_ARRAY_OUT_TYPEMAPS_GEN(type)

%typemap(out) ublas_convert::NumPy1DArray< type > = mds_utils::python::Obj;

%enddef

NUMPY_ARRAY_OUT_TYPEMAPS_GEN(char)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(unsigned char)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(short)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(unsigned short)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(int)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(unsigned int)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(long)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(unsigned long)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(long long)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(unsigned long long)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(size_t)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(float)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(double)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(long double)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(std::complex<float>)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(std::complex<double>)
NUMPY_ARRAY_OUT_TYPEMAPS_GEN(std::complex<long double>)

