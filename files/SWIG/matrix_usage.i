// matrix_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)


/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../../include -o matrix_usage_wrap.cpp matrix_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	matrix_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::ublas::to_python and
 * mds_utils::python::ublas::get usage for boost::numeric::ublas::matrix objects.
 * These functions are indirectly
 * used through typemaps included with the matrix.i interface.
 * The output from the Python command line is shown in matrix_usage.pycmd.
 *
 * \remarks	Here I've used SWIG for convenience only. The C++ code of
 * 			mds-utils does not require you to make this choice.
 */

%module matrix_usage

// The following instruction includes all the required typemaps
%include "mds_utils/python/ublas/matrix.i"

%header %{
#include <boost/numeric/ublas/io.hpp>
#include <algorithm>
#include <iostream>
#include <complex>

namespace mdspy = mds_utils::python;
using namespace std;
%}


%feature("autodoc","3");

%inline %{

// Tests building and returning a matrix with column major ordering, without direct conversion to NumPy
boost::numeric::ublas::matrix<double,boost::numeric::ublas::column_major>*
	create_ublas_matrix_column_major() {

	namespace ub = boost::numeric::ublas;
	
	double	buf[] = {1.1,2.2,3.3,4.4,5.5,6.6};
	
	size_t	Nel(sizeof(buf)/sizeof(buf[0]));
	
	ub::matrix<double,ub::column_major>
		*pM(new ub::matrix<double,ub::column_major>(3,2));
	
	copy(buf,buf+Nel,pM->data().begin());
			
	return pM;
}


void destroy_ublas_matrix_column_major(boost::numeric::ublas::matrix<double,boost::numeric::ublas::column_major>* pM) {
	
	delete pM;
}


// Tests building and returning a matrix with column major ordering
ublas_convert::matrix<double,boost::numeric::ublas::column_major>
	create_npy_array() {
	
	namespace ub = boost::numeric::ublas;
	
	ub::matrix<double,ub::column_major>*
		pM(create_ublas_matrix_column_major());
		
	ub::matrix<double,ub::column_major>
		out(*pM);
		
	delete pM; pM = NULL;
			
	return out;
}


// Tests building and returning a matrix with row major ordering
ublas_convert::matrix<double>
	create_npy_array_row() {

	namespace ub = boost::numeric::ublas;
	
	double	buf[] = {1.1,2.2,3.3,4.4,5.5,6.6};
	
	size_t	Nel(sizeof(buf)/sizeof(buf[0]));
	
	ub::matrix<double>
		M(3,2);
	
	copy(buf,buf+Nel,M.data().begin());
			
	return M;
}


// Tests building and returning a matrix with complex elements
ublas_convert::matrix< std::complex<double> >
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
	
	ub::matrix< complex<double> >
		M(3,2);
	
	copy(buf,buf+Nel,M.data().begin());
			
	return M;
}


// Tests building and returning a matrix of short, without conversion
boost::numeric::ublas::matrix<short>
	create_ublas_matrix_short() {

	namespace ub = boost::numeric::ublas;
	
	short	buf[] = {-1,2,-3,4,5,-6};
	
	size_t	Nel(sizeof(buf)/sizeof(buf[0]));
	
	ub::matrix<short>
		M(3,2);
	
	copy(buf,buf+Nel,M.data().begin());
			
	return M;
}


// Tests building and returning a matrix of short
ublas_convert::matrix<short>
	create_npy_array_short() {

	return create_ublas_matrix_short();
}



// Tests the "from Python converter"
void get_matrix(ublas_convert::matrix<double> m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}


// Tests getting a matrix directly (i.e. without conversion from NumPy)
void get_matrix_no_conversion(const boost::numeric::ublas::matrix<double,boost::numeric::ublas::column_major>& m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}


// Tests the "from Python converter" (opposite storage)
void get_matrix2(ublas_convert::matrix<double,boost::numeric::ublas::column_major> m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}

// Tests the "from Python converter" for complex numbers
void get_matrix3(ublas_convert::matrix< std::complex<double> > m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}

// Tests the "from Python converter", with conversion cast
void get_matrix4(ublas_convert::matrix<char> m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}



%}


%init %{
	// The following instruction probably performs a dlopen for loading the
	// numpy library. Without it, nothing works.
	import_array();
%}


