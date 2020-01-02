// sequence_iterator_example.i
// 
// Copyright (c) 2012 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../include -o sequence_iterator_example_wrap.cpp sequence_iterator_example.i
 *
 * 2. python setup.py build
 */


/**
 * \example	sequence_iterator_example.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::PySequenceIterator usage.
 *
 * \remarks	Here I've used SWIG for convenience only. The
 * 			mds_utils::python::PySequenceIterator does not impose you
 * 			this choice.
 */


%module sequence_iterator_test

// Include the following interface files for having the proper typemaps
%include "mds_utils/python/common.i"

%{
#include <mds_utils/python/sequence_iterator.hpp>

/*
 * The source code of the following two files is into the
 * "examples/python" directory.
 */
#include "print_seq.hpp"
#include "incr_seq.hpp"

 using namespace mds_utils::python;
%}

template<class InIt>
void print_seq(InIt,InIt);

template<class InIt>
void incr_seq(InIt,InIt);


%typemap(in) (PySequenceIterator<double>,PySequenceIterator<double>) {
	try {
		$1 = PySequenceIterator<double>($input);
		$2 = PySequenceIterator<double>($input,true);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typemap(in) (PySequenceIterator< std::complex<double> >,PySequenceIterator< std::complex<double> >) {
	try {
		$1 = PySequenceIterator< std::complex<double> >($input);
		$2 = PySequenceIterator< std::complex<double> >($input,true);
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}


%template(print_seq_d) print_seq< PySequenceIterator<double> >;

%template(print_seq_cplx) print_seq< PySequenceIterator< std::complex<double> > >;

%template(incr_seq_d) incr_seq< PySequenceIterator<double> >;

%template(incr_seq_cplx) incr_seq< PySequenceIterator< std::complex<double> > >;


