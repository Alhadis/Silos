// tuple_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../include -o tuple_usage_wrap.cpp tuple_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	tuple_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::Tuple usage.
 *
 * \remarks	Here I've used SWIG for convenience only. The
 * 			mds_utils::python::Tuple class does not impose you
 * 			this choice.
 */

%module tuple_usage

// Include the following interface files for having the proper typemaps
%include "mds_utils/python/common.i"
%include "mds_utils/python/tuple.i"


%header %{
#include <mds_utils/python/conversion.hpp>
#include <mds_utils/python/tuple.hpp>
#include <mds_utils/python/sequence_iterator.hpp>
#include <boost/fusion/container/vector.hpp>
#include <iostream>

namespace mdspy = mds_utils::python;
%}


%inline %{

// Tests the call to Tuple::set(mdspy::Obj)
PyObject* create_tuple(mds_utils::python::Obj o) {

	using namespace std;

	mdspy::Tuple	t;
	
	t.set(o);
	
	cout << "Built tuple length: " << t.len() << endl;

	PyObject *pret(t.transfer());
	
	return pret;
}


// Tests the call to Tuple::set(const seq_T&)
PyObject* create_from_fusion() {

	namespace fus = boost::fusion;
	
	mdspy::Tuple	t;
	
	fus::vector<int,double,std::string>
		v(1,2.2,"aaa");
	
	t.set(v);
	
	return t.transfer();
}


// Tests the Tuple::set(FwIt,FwIt) method
PyObject* create_from_seq(mds_utils::python::Obj o) {

	mdspy::PySequenceIterator<mdspy::Obj>
		b(o),
		e(o,true);

	mdspy::Tuple	t;
	
	t.set(b,e);
	
	return t.transfer();
}


// Like the previous one, but returning directly a mdspy::Tuple
// This tests the output typemap
mds_utils::python::Tuple create_from_seq2(mds_utils::python::Obj o) {

	mdspy::PySequenceIterator<mdspy::Obj>
		b(o),
		e(o,true);

	mdspy::Tuple	t;
	
	t.set(b,e);
	
	return t;
}

// Test for element access with operator []
mds_utils::python::Obj access_element(mds_utils::python::Obj o,long i) {
	mdspy::Tuple	t(o);
	return t[i];
}


// This shows that the assignment to an element of the tuple fails
void set_element(mds_utils::python::Obj o,long i,mds_utils::python::Obj v) {
	mdspy::Tuple	t(o);
	t[i] = v;
}


%}
