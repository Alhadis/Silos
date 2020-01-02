// array_iter_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)


/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../../include -o array_iter_usage_wrap.cpp array_iter_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	array_iter_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::numpy::NDArrayIterator
 *
 * \remarks	Here I've used SWIG for convenience only. The C++ code of
 * 			mds-utils does not require you to make this choice.
 */

%module array_iter_usage

%include "mds_utils/python/common.i"

%header %{
#include <mds_utils/python/numpy/array_iterator.hpp>
#include <iostream>
#include <algorithm>
#include <complex>

using namespace std;

namespace mds_npy = mds_utils::python::numpy;
%}

%feature("autodoc","3");

%inline %{

// Tests accessing array elements for reading (FORTRAN ordering)
void print_array_elements(PyObject *array) {
	
	mds_npy::NDArrayIterator<double,mds_npy::fortran_storage,NPY_ITER_READONLY>
		arr_it(reinterpret_cast<PyArrayObject*>(array)),
		arr_it_end(reinterpret_cast<PyArrayObject*>(array),true);
		
	cout << "\nPrint array:" << endl;

	for_each(arr_it,arr_it_end,
		[](decltype(*arr_it) x) {
			cout << static_cast<double>(x) << endl;
		});
		
	cout << "------------" << endl;

	
	cout << static_cast<double>(*arr_it) << endl;
	++arr_it;
	cout << static_cast<double>(*arr_it) << endl;
	++arr_it;
	cout << static_cast<double>(*arr_it) << endl;
	++arr_it;
	
	// Tests decrement
	--arr_it;
	cout << static_cast<double>(*arr_it) << endl;
	
	// Tests random access
	arr_it -= 1;
	cout << static_cast<double>(*arr_it) << endl;
	
}


// Tests modification of some elements (FORTRAN ordering)
void modify_array_elements(PyObject *array) {
	
	mds_npy::NDArrayIterator<double,mds_npy::fortran_storage>
		arr_it(reinterpret_cast<PyArrayObject*>(array));
	
	*arr_it++ = 7.;
	*arr_it++ = 9.;	
}


// Tests accessing elements with cast (C ordering)
void print_int_elements(PyObject *array) {
	
	mds_npy::NDArrayIterator<int,mds_npy::c_storage,NPY_ITER_READONLY>
		arr_it(reinterpret_cast<PyArrayObject*>(array)),
		arr_it_end(arr_it,true);
				
	cout << "\nPrint array:" << endl;


	for_each(arr_it,arr_it_end,
		[](decltype(*arr_it) x) {
			cout << static_cast<int>(x) << endl;
		});
	
	cout << "------------" << endl;

}


// Tests modification of array elements with cast (C ordering)
void modify_int_elements(PyObject *array) {
	
	mds_npy::NDArrayIterator<int,mds_npy::c_storage>
		arr_it(reinterpret_cast<PyArrayObject*>(array));
	
	*arr_it++ = 10;
	*arr_it++ = 11;	
}


// Tests accessing complex elements with cast (C ordering)
void print_fcplx_elements(PyObject *array) {
	
	mds_npy::NDArrayIterator<complex<float>,mds_npy::c_storage,NPY_ITER_READONLY>
		arr_it(reinterpret_cast<PyArrayObject*>(array)),
		arr_it_end(arr_it,true);
				
	cout << "\nPrint array:" << endl;


	for_each(arr_it,arr_it_end,
		[](decltype(*arr_it) x) {
			cout << static_cast< complex<float> >(x) << endl;
		});
	
	cout << "------------" << endl;

}


// Tests modification of complex array elements with cast (C ordering)
void modify_fcplx_elements(PyObject *array) {
	
	mds_npy::NDArrayIterator<complex<float>,mds_npy::c_storage>
		arr_it(reinterpret_cast<PyArrayObject*>(array));
	
	arr_it += 2;
	*arr_it++ = complex<float>(10.1,30.1);
	*arr_it++ = complex<float>(14.8,9.7);
}

%}


%init %{
	// The following instruction probably performs a dlopen for loading the
	// numpy library. Without it, nothing works.
	import_array();
%}




