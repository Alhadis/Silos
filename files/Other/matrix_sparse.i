// mds_utils/python/ublas/matrix_sparse.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%header %{
#include <mds_utils/python/ublas/matrix_sparse.hpp>

namespace ublas_convert = boost::numeric::ublas;
%}



%define MATRIX_SPARSE_IN_TYPEMAPS_GEN(type)

%typemap(in) (ublas_convert::compressed_matrix< type >) {
	try {
		$1 = mds_utils::python::ublas::get< boost::numeric::ublas::compressed_matrix< type > >($input);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typecheck(SWIG_TYPECHECK_POINTER) ublas_convert::compressed_matrix< type > {

	mds_utils::python::Obj	module(PyImport_ImportModule("scipy.sparse"));
	
	module.get_ownership();
	
	mds_utils::python::Obj	type_obj(module.attr("csr_matrix");
			
	$1 = PyType_Check(type_obj) &&
		PyObject_TypeCheck($input,
			reinterpret_cast<PyTypeObject*>(
				static_cast<PyObject*>(type_obj)));
	
	module.decref();
}


%typemap(in) (ublas_convert::compressed_matrix< type ,boost::numeric::ublas::column_major>) {
	try {
		$1 = mds_utils::python::ublas::get< boost::numeric::ublas::compressed_matrix< type ,boost::numeric::ublas::column_major> >($input);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typecheck(SWIG_TYPECHECK_POINTER) ublas_convert::compressed_matrix< type ,boost::numeric::ublas::column_major> {

	mds_utils::python::Obj	module(PyImport_ImportModule("scipy.sparse"));
	
	module.get_ownership();
	
	mds_utils::python::Obj	type_obj(module.attr("csc_matrix");
			
	$1 = PyType_Check(type_obj) &&
		PyObject_TypeCheck($input,
			reinterpret_cast<PyTypeObject*>(
				static_cast<PyObject*>(type_obj)));
	
	module.decref();
}


%enddef

MATRIX_SPARSE_IN_TYPEMAPS_GEN(char)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(unsigned char)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(short)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(unsigned short)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(int)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(unsigned int)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(long)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(unsigned long)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(long long)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(unsigned long long)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(size_t)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(float)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(double)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(long double)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(std::complex<float>)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(std::complex<double>)
MATRIX_SPARSE_IN_TYPEMAPS_GEN(std::complex<long double>)


%typemap(out) ublas_convert::compressed_matrix<double> {
	$result = mds_utils::python::ublas::to_python($1);
}

%typemap(out) ublas_convert::compressed_matrix<double,boost::numeric::ublas::row_major> = ublas_convert::compressed_matrix<double>;
%typemap(out) ublas_convert::matrix<double,boost::numeric::ublas::column_major> = ublas_convert::compressed_matrix<double>;


%define MATRIX_SPARSE_OUT_TYPEMAPS_GEN(type)

%typemap(out) ublas_convert::compressed_matrix< type > = ublas_convert::compressed_matrix<double>;
%typemap(out) ublas_convert::compressed_matrix< type,boost::numeric::ublas::row_major> = ublas_convert::compressed_matrix<double>;
%typemap(out) ublas_convert::compressed_matrix< type,boost::numeric::ublas::column_major> = ublas_convert::compressed_matrix<double>;

%enddef

MATRIX_SPARSE_OUT_TYPEMAPS_GEN(char)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(unsigned char)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(short)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(unsigned short)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(int)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(unsigned int)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(long)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(unsigned long)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(long long)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(unsigned long long)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(size_t)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(float)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(long double)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(std::complex<float>)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(std::complex<double>)
MATRIX_SPARSE_OUT_TYPEMAPS_GEN(std::complex<long double>)

