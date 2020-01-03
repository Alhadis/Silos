// ublas_pkg_usage.i
//
// This SWIG interface shows how to reuse classes wrapped by the
// mds_utils.ublas.ublas.py module.
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Usage example for the mds_utils.ublas Python module.
 *
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../../include -I../../../../python -o ublas_pkg_usage_wrap.cpp ublas_pkg_usage.i
 *
 * 2. python setup.py build
 *
 * Instructions for using the generated example:
 *
 * Before using the generated python module, ensure that your
 * PYTHONPATH environment variable contains the path to reach the
 * mds_utils Python package. For example, if the mds_utils package has
 * been built but not installed yet, it is typically found into the
 * mds-utils/python/build/lib.linux-<arch>-<Python version> directory
 * (for a Linux build) and you have to add this path to your PYTHONPATH
 * variable. After that, you can import the ublas_pkg_usage module and
 * try it. The use from the command line is shown into the
 * ublas_pkg_usage.pycmd file.
 */


%module ublas_pkg_usage

// Make all necessary inclusions before importing the ublas module
%include <mds_utils/python/common.i>

// Import the ublas module: this will share the wrapped objects in ublas
%import "mds_utils/ublas/ublas.i"

// Start wrapping code for the ublas_pkg_usage module

%header %{
#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/matrix_sparse.hpp>
%}

%inline %{

boost::numeric::ublas::vector<double> create_vector() {

	using namespace boost::numeric::ublas;
	
	vector<double>	v(3);
	
	v[0] = 1.1; v[1] = 2.2; v[2] = 3.3;
	
	return v;
}

boost::numeric::ublas::compressed_matrix<double>
	create_compressed_matrix() {
	
	using namespace boost::numeric::ublas;
	
	compressed_matrix<double>
		m(4,3);
		
	m(1,0) = 1.1; m(0,2) = 2.2; m(3,1) = 3.3;
	
	return m;
}

// Tests inheritance
class my_vec : public boost::numeric::ublas::vector<double> {
};


%}
