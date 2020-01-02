// matrix_sparse_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)


/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../../include -o matrix_sparse_usage_wrap.cpp matrix_sparse_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	matrix_sparse_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::ublas::to_python and
 * mds_utils::python::ublas::get usage for boost::numeric::ublas::compressed_matrix objects.
 * These functions are indirectly
 * used through typemaps included with the matrix_sparse.i interface.
 * The output from the Python command line is shown in matrix_sparse_usage.pycmd.
 *
 * \remarks	Here I've used SWIG for convenience only. The C++ code of
 * 			mds-utils does not require you to make this choice.
 */

%module matrix_sparse_usage

%include "mds_utils/python/common.i"
// The following instruction includes all the required typemaps
%include "mds_utils/python/ublas/matrix_sparse.i"

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

// Tests the "from Python converter" for real double values
void get_matrix(ublas_convert::compressed_matrix<double> m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}

// Tests the "from Python converter" for complex double values
void get_matrix_cplx(ublas_convert::compressed_matrix< std::complex<double> > m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}


// Tests the "from Python converter" for complex float values
void get_matrix_fcplx(ublas_convert::compressed_matrix< std::complex<float> > m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}

// Tests the "from Python converter" for integer values
void get_matrix_int(ublas_convert::compressed_matrix<int> m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}

// Tests the "from Python converter" for real double values and csc matrices
void get_csc_matrix(ublas_convert::compressed_matrix<double,boost::numeric::ublas::column_major> m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}


// Tests building and returning a compressed matrix without direct conversion to NumPy
boost::numeric::ublas::compressed_matrix<double>*
	create_ublas_compressed_matrix() {

	namespace ub = boost::numeric::ublas;
	
	ub::compressed_matrix<double>*
		pM(new ub::compressed_matrix<double>(4,3));
	
	ub::compressed_matrix<double>&	M(*pM);
	
	M(0,1) = 1.1; M(3,0) = 2.2; M(2,2) = 3.3;	
	
	return pM;
}

// Destructor needed, because I've not exposed the compressed_matrix class
void destroy_ublas_compressed_matrix(boost::numeric::ublas::compressed_matrix<double>* pM) {
	delete pM;
}


// Tests building and returning a csr matrix
ublas_convert::compressed_matrix<double>
	create_csr_matrix() {
	
	namespace ub = boost::numeric::ublas;
	
	ub::compressed_matrix<double>*
		pM(create_ublas_compressed_matrix());
	
	ub::compressed_matrix<double>
		out(*pM);
		
	destroy_ublas_compressed_matrix(pM); pM = NULL;
			
	return out;
}


// Tests building and returning a complex<float> csr matrix
ublas_convert::compressed_matrix< std::complex<float>,boost::numeric::ublas::column_major >
	create_csc_matrix_fcplx() {
	
	namespace ub = boost::numeric::ublas;
	
	ub::compressed_matrix< std::complex<float>,ub::column_major >
		M(4,3);
		
	M(0,1) = std::complex<float>(1.1,1.1);
	M(3,0) = std::complex<float>(2.2,2.2);
	M(2,2) = std::complex<float>(3.3,3.3);
				
	return M;
}

// Tests getting a compressed matrix directly (i.e. without conversion from NumPy)
void get_matrix_no_conversion(const boost::numeric::ublas::compressed_matrix<double>& m) {
	using namespace std;
	
	cout << "Matrix got:" << endl << m << endl;
}

%}

%init %{
	// The following instruction probably performs a dlopen for loading the
	// numpy library. Without it, nothing works.
	import_array();
%}

