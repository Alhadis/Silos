// mds_utils/python/ublas/vector.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)


%header %{
#include <mds_utils/python/ublas/vector.hpp>

namespace ublas_convert = boost::numeric::ublas;
%}

%define VECTOR_IN_TYPEMAPS_GEN(type)

%typemap(in) (ublas_convert::vector< type >) {
	try {
		$1 = mds_utils::python::ublas::get< boost::numeric::ublas::vector< type > >($input);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typecheck(SWIG_TYPECHECK_POINTER) ublas_convert::vector< type > {
  $1 = PyArray_Check($input);
}


%enddef

VECTOR_IN_TYPEMAPS_GEN(char)
VECTOR_IN_TYPEMAPS_GEN(unsigned char)
VECTOR_IN_TYPEMAPS_GEN(short)
VECTOR_IN_TYPEMAPS_GEN(unsigned short)
VECTOR_IN_TYPEMAPS_GEN(int)
VECTOR_IN_TYPEMAPS_GEN(unsigned int)
VECTOR_IN_TYPEMAPS_GEN(long)
VECTOR_IN_TYPEMAPS_GEN(unsigned long)
VECTOR_IN_TYPEMAPS_GEN(long long)
VECTOR_IN_TYPEMAPS_GEN(unsigned long long)
VECTOR_IN_TYPEMAPS_GEN(size_t)
VECTOR_IN_TYPEMAPS_GEN(float)
VECTOR_IN_TYPEMAPS_GEN(double)
VECTOR_IN_TYPEMAPS_GEN(long double)
VECTOR_IN_TYPEMAPS_GEN(std::complex<float>)
VECTOR_IN_TYPEMAPS_GEN(std::complex<double>)
VECTOR_IN_TYPEMAPS_GEN(std::complex<long double>)

%typemap(out) ublas_convert::vector<double> {
	$result = mds_utils::python::ublas::to_python($1);
}



%define VECTOR_OUT_TYPEMAPS_GEN(type)

%typemap(out) ublas_convert::vector< type > = ublas_convert::vector<double>;

%enddef

VECTOR_OUT_TYPEMAPS_GEN(char)
VECTOR_OUT_TYPEMAPS_GEN(unsigned char)
VECTOR_OUT_TYPEMAPS_GEN(short)
VECTOR_OUT_TYPEMAPS_GEN(unsigned short)
VECTOR_OUT_TYPEMAPS_GEN(int)
VECTOR_OUT_TYPEMAPS_GEN(unsigned int)
VECTOR_OUT_TYPEMAPS_GEN(long)
VECTOR_OUT_TYPEMAPS_GEN(unsigned long)
VECTOR_OUT_TYPEMAPS_GEN(long long)
VECTOR_OUT_TYPEMAPS_GEN(unsigned long long)
VECTOR_OUT_TYPEMAPS_GEN(size_t)
VECTOR_OUT_TYPEMAPS_GEN(float)
VECTOR_OUT_TYPEMAPS_GEN(long double)
VECTOR_OUT_TYPEMAPS_GEN(std::complex<float>)
VECTOR_OUT_TYPEMAPS_GEN(std::complex<double>)
VECTOR_OUT_TYPEMAPS_GEN(std::complex<long double>)

