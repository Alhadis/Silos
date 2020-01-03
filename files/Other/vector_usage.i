// vector_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)


/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../../include -o vector_usage_wrap.cpp vector_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	vector_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::ublas::to_python and
 * mds_utils::python::ublas::get usage for boost::python::ublas::vector objects. 
 * These functions are indirectly
 * used through typemaps included with the vector.i interface.
 * The output from the Python command line is shown in vector_usage.pycmd.
 *
 * \remarks	Here I've used SWIG for convenience only. The C++ code of
 * 			mds-utils does not require you to make this choice.
 */

%module vector_usage

// The following instruction includes all the required typemaps
%include "mds_utils/python/ublas/vector.i"

%header %{
#include <boost/numeric/ublas/io.hpp>
#include <algorithm>
#include <iostream>
#include <complex>

using namespace std;
%}

%feature("autodoc","3");

%inline %{

// Tests building and returning a vector without converting to NumPy
boost::numeric::ublas::vector<double>*
	create_ublas_vector() {

	namespace ub = boost::numeric::ublas;
	
	double	buf[] = {1.1,2.2,3.3,4.4,5.5,6.6};
	
	size_t	Nel(sizeof(buf)/sizeof(buf[0]));
	
	ub::vector<double>
		*pv(new ub::vector<double>(Nel));
	
	copy(buf,buf+Nel,pv->begin());
			
	return pv;
}

void destroy_ublas_vector(boost::numeric::ublas::vector<double>* pv) {
	
	delete pv;
}

// Tests building and returning a vector, with conversion to NumPY
ublas_convert::vector<double>
	create_npy_array() {
	
	namespace ub = boost::numeric::ublas;
	
	ub::vector<double>*
		pv(create_ublas_vector());
		
	ub::vector<double>
		out(*pv);
	
	delete pv; pv = NULL;
		
	return out;
}


// Tests building and returning a vector with complex elements
ublas_convert::vector< std::complex<double> >
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
	
	ub::vector< complex<double> >
		v(Nel);
	
	copy(buf,buf+Nel,v.data().begin());
			
	return v;
}


// Tests building and returning a vector with conversion to NumPy
ublas_convert::vector<short>
	create_npy_array_short() {
			
	namespace ub = boost::numeric::ublas;
	
	short	buf[] = {-1,2,-3,4,5,-6};
	
	size_t	Nel(sizeof(buf)/sizeof(buf[0]));
	
	ub::vector<short>
		v(Nel);
	
	copy(buf,buf+Nel,v.data().begin());
			
	return v;
}



// Tests the "from Python converter"
void get_vec(ublas_convert::vector<double> v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}


// Tests getting a vector directly (i.w. without conversion from NumPy)
void get_vec_no_conversion(const boost::numeric::ublas::vector<double>& v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}


// Tests the "from Python converter" for complex numbers
void get_vec_cplx(ublas_convert::vector< std::complex<double> > v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}

// Tests the "from Python converter" for complex float numbers
void get_vec_fcplx(ublas_convert::vector< std::complex<float> > v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}

// Tests the "from Python converter", with conversion cast
void get_vec_cast(ublas_convert::vector<short> v) {
	using namespace std;
	
	cout << "Vector got:" << endl << v << endl;
}



%}


%init %{
	// The following instruction probably performs a dlopen for loading the
	// numpy library. Without it, nothing works.
	import_array();
%}



