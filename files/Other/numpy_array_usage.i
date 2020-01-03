// numpy_array_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)


/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../../include -o numpy_array_usage_wrap.cpp numpy_array_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	numpy_array_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::ublas::NumPy1DArray wrapper usage. 
 * Proper typemaps are included with the numpy_array.i interface.
 * The output from the Python command line is shown in numpy_array_usage.pycmd.
 *
 * \remarks	Here I've used SWIG for convenience only. The C++ code of
 * 			mds-utils does not require you to make this choice.
 */

%module numpy_array_usage

// The following instruction includes all the required typemaps
%include "mds_utils/python/ublas/numpy_array.i"

%header %{
#include <boost/numeric/ublas/io.hpp>
#include <algorithm>
#include <iostream>
#include <complex>

using namespace std;
%}

%feature("autodoc","3");

%inline %{

// Tests building and returning a NumPy1DArray without converting to NumPy
boost::numeric::ublas::NumPy1DArray<double>*
	create_NumPy1DArray() {

	namespace ub = boost::numeric::ublas;
	
	double	buf[] = {1.1,2.2,3.3,4.4,5.5,6.6};
	
	size_t	Nel(sizeof(buf)/sizeof(buf[0]));
	
	ub::NumPy1DArray<double>
		*pv(new ub::NumPy1DArray<double>(buf,buf+Nel));
	
	return pv;
}

void destroy_NumPy1DArray(boost::numeric::ublas::NumPy1DArray<double>* pv) {
	
	delete pv;
}

// Tests building and returning a NumPy1DArray, with conversion to NumPY
ublas_convert::NumPy1DArray<double>
	create_npy_array() {
	
	namespace ub = boost::numeric::ublas;
	
	ub::NumPy1DArray<double>*
		pv(create_NumPy1DArray());
		
	ub::NumPy1DArray<double>
		out(*pv);
	
	delete pv; pv = NULL;
		
	return out;
}


// Tests building and returning a NumPy1DArray with complex elements
ublas_convert::NumPy1DArray< std::complex<double> >
	create_npy_array_cplx() {

	namespace ub = boost::numeric::ublas;
	
	complex<double>	buf[] = {
		complex<double>(1.1,1.1),
		complex<double>(2.2,2.2),
		complex<double>(3.3,3.3),
		complex<double>(4.4,4.4),
		complex<double>(5.5,5.5),
		complex<double>(6.6,6.6)
	};
	
	size_t	Nel(6);
	
	ub::NumPy1DArray< complex<double> >
		v(buf,buf+Nel);
	
	return v;
}


// Tests building and returning a NumPy1DArray of shorts with conversion to NumPy
ublas_convert::NumPy1DArray<short>
	create_npy_array_short() {
			
	namespace ub = boost::numeric::ublas;
	
	short	buf[] = {-1,2,-3,4,5,-6};
	
	size_t	Nel(sizeof(buf)/sizeof(buf[0]));
	
	ub::NumPy1DArray<short>
		v(buf,buf+Nel);
				
	return v;
}



// Tests the "from Python converter"
void get_vec(ublas_convert::NumPy1DArray<double> v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}


// Tests getting a NumPy1DArray directly (i.w. without conversion from NumPy)
void get_vec_no_conversion(const boost::numeric::ublas::NumPy1DArray<double>& v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}


// Tests the "from Python converter" for complex numbers
void get_vec_cplx(ublas_convert::NumPy1DArray< std::complex<double> > v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}

// Tests the "from Python converter" for complex float numbers
void get_vec_fcplx(ublas_convert::NumPy1DArray< std::complex<float> > v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}

// Tests the "from Python converter", with conversion cast
void get_vec_cast(ublas_convert::NumPy1DArray<short> v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}


// Tests a simple uBLAS operation on the NumPy array, modifying the argument

void doublevec(ublas_convert::NumPy1DArray<double>& v) {

	v *= 2.;
}

// The same as before, but with pointer argument

void doublevecp(ublas_convert::NumPy1DArray<double>* v) {

	*v *= 2.;
}


%}


%init %{
	// The following instruction probably performs a dlopen for loading the
	// numpy library. Without it, nothing works.
	import_array();
%}



