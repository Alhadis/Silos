// list_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../include -o list_usage_wrap.cpp list_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	list_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::List usage.
 *
 * \remarks	Here I've used SWIG for convenience only. The
 * 			mds_utils::python::List class does not impose you
 * 			this choice.
 */

%module list_usage

// Include the following interface files for having the proper typemaps
%include "mds_utils/python/common.i"
%include "mds_utils/python/list.i"

%header %{
#include <mds_utils/python/conversion.hpp>
#include <mds_utils/python/list.hpp>
#include <mds_utils/python/sequence_iterator.hpp>
#include <boost/fusion/container/vector.hpp>
#include <iostream>

namespace mdspy = mds_utils::python;
%}


%inline %{

// Tests the call to List::set(mds_utils::python::Obj)
PyObject* create_list(mds_utils::python::Obj o) {

	using namespace std;

	mdspy::List	t;
	
	t.set(o);
	
	cout << "Built list length: " << t.len() << endl;

	PyObject *pret(t.transfer());
	
	return pret;
}


// Tests the call to List::set(const seq_T&)
PyObject* create_from_fusion() {

	namespace fus = boost::fusion;
	
	mdspy::List	t;
	
	fus::vector<int,double,std::string>
		v(1,2.2,"aaa");
	
	t.set(v);
	
	return t.transfer();
}


// Tests the List::set(FwIt,FwIt) method
PyObject* create_from_seq(mds_utils::python::Obj o) {

	mdspy::PySequenceIterator<mdspy::Obj>
		b(o),
		e(o,true);

	mdspy::List	t;
	
	t.set(b,e);
	
	return t.transfer();
}


// Like the previous one, but returning directly a mds_utils::python::List
// This tests the output typemap
mds_utils::python::List create_from_seq2(mds_utils::python::Obj o) {

	mdspy::PySequenceIterator<mdspy::Obj>
		b(o),
		e(o,true);

	mdspy::List	t;
	
	t.set(b,e);
	
	return t;
}

// Test for element access with operator []
mds_utils::python::Obj access_element(mds_utils::python::List l,long i) {
	return l[i];
}

// Test for element assignment through operator []
void set_element(mds_utils::python::List l,long i,mds_utils::python::Obj v) {
	l[i] = v;
}

// Test the append method
void append_element(mds_utils::python::List l,mds_utils::python::Obj v) {
	l.append(v);
}

// Test directly appending a basic type
void append_double(mds_utils::python::List l) {
	l.append(1.1);
}


// Test the insert method
void insert_element(mds_utils::python::List l,long i,mds_utils::python::Obj v) {
	l.insert(i,v);
}


// Test the del method
void del_element(mds_utils::python::List l,long i) {
	l.del(i);
}


// Test the sort method
void sort_list(mds_utils::python::List l) {
	l.sort();
}


// Test the reverse method
void reverse_list(mds_utils::python::List l) {
	l.reverse();
}


// Tests the copy-constructor
// This function does not actually duplicate the list
// It simply creates another Python object pointing to the same
// list
mds_utils::python::List dup_list(mds_utils::python::List l) {
	mdspy::List	retval(l);
	return retval;
}


// Tests the copy-assignment
// This function does not actually duplicate the list
// It simply creates another Python object pointing to the same
// list
mds_utils::python::List dup_list2(mds_utils::python::List l) {
	mdspy::List	retval;
	
	retval = l;
	
	return retval;
}

%}
