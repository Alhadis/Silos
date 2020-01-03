// mds_utils/python/ublas/matrix.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%include "mds_utils/python/common.i"
%include "mds_utils/python/obj.i"
%include "std_complex.i"

%header %{
#include <complex>
#include <mds_utils/python/ublas/matrix.hpp>

namespace ublas_convert = boost::numeric::ublas;
%}


%define MATRIX_IN_TYPEMAPS_GEN(type)

%typemap(in) (ublas_convert::matrix< type >) {
	try {
		$1 = mds_utils::python::ublas::get< boost::numeric::ublas::matrix< type > >($input);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typecheck(SWIG_TYPECHECK_POINTER) ublas_convert::matrix< type > {
  $1 = PyArray_Check($input);
}


%typemap(in) (ublas_convert::matrix< type ,boost::numeric::ublas::row_major>) {
	try {
		$1 = mds_utils::python::ublas::get< boost::numeric::ublas::matrix< type ,boost::numeric::ublas::row_major> >($input);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typecheck(SWIG_TYPECHECK_POINTER) ublas_convert::matrix< type ,boost::numeric::ublas::row_major> {
  $1 = PyArray_Check($input);
}


%typemap(in) (ublas_convert::matrix< type ,boost::numeric::ublas::column_major>) {
	try {
		$1 = mds_utils::python::ublas::get< boost::numeric::ublas::matrix< type ,boost::numeric::ublas::column_major> >($input);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typecheck(SWIG_TYPECHECK_POINTER) ublas_convert::matrix< type ,boost::numeric::ublas::column_major> {
  $1 = PyArray_Check($input);
}

%enddef

MATRIX_IN_TYPEMAPS_GEN(char)
MATRIX_IN_TYPEMAPS_GEN(unsigned char)
MATRIX_IN_TYPEMAPS_GEN(short)
MATRIX_IN_TYPEMAPS_GEN(unsigned short)
MATRIX_IN_TYPEMAPS_GEN(int)
MATRIX_IN_TYPEMAPS_GEN(unsigned int)
MATRIX_IN_TYPEMAPS_GEN(long)
MATRIX_IN_TYPEMAPS_GEN(unsigned long)
MATRIX_IN_TYPEMAPS_GEN(long long)
MATRIX_IN_TYPEMAPS_GEN(unsigned long long)
MATRIX_IN_TYPEMAPS_GEN(size_t)
MATRIX_IN_TYPEMAPS_GEN(float)
MATRIX_IN_TYPEMAPS_GEN(double)
MATRIX_IN_TYPEMAPS_GEN(long double)
MATRIX_IN_TYPEMAPS_GEN(std::complex<float>)
MATRIX_IN_TYPEMAPS_GEN(std::complex<double>)
MATRIX_IN_TYPEMAPS_GEN(std::complex<long double>)

%typemap(out) ublas_convert::matrix<double> {
	$result = mds_utils::python::ublas::to_python($1);
}

%typemap(out) ublas_convert::matrix<double,boost::numeric::ublas::row_major> = ublas_convert::matrix<double>;
%typemap(out) ublas_convert::matrix<double,boost::numeric::ublas::column_major> = ublas_convert::matrix<double>;


%define MATRIX_OUT_TYPEMAPS_GEN(type)

%typemap(out) ublas_convert::matrix< type > = ublas_convert::matrix<double>;
%typemap(out) ublas_convert::matrix< type,boost::numeric::ublas::row_major> = ublas_convert::matrix<double>;
%typemap(out) ublas_convert::matrix< type,boost::numeric::ublas::column_major> = ublas_convert::matrix<double>;

%enddef

MATRIX_OUT_TYPEMAPS_GEN(char)
MATRIX_OUT_TYPEMAPS_GEN(unsigned char)
MATRIX_OUT_TYPEMAPS_GEN(short)
MATRIX_OUT_TYPEMAPS_GEN(unsigned short)
MATRIX_OUT_TYPEMAPS_GEN(int)
MATRIX_OUT_TYPEMAPS_GEN(unsigned int)
MATRIX_OUT_TYPEMAPS_GEN(long)
MATRIX_OUT_TYPEMAPS_GEN(unsigned long)
MATRIX_OUT_TYPEMAPS_GEN(long long)
MATRIX_OUT_TYPEMAPS_GEN(unsigned long long)
MATRIX_OUT_TYPEMAPS_GEN(size_t)
MATRIX_OUT_TYPEMAPS_GEN(float)
MATRIX_OUT_TYPEMAPS_GEN(long double)
MATRIX_OUT_TYPEMAPS_GEN(std::complex<float>)
MATRIX_OUT_TYPEMAPS_GEN(std::complex<double>)
MATRIX_OUT_TYPEMAPS_GEN(std::complex<long double>)
