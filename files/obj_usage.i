// obj_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../include -o obj_usage_wrap.cpp obj_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	obj_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::Obj usage.
 *
 * \remarks	Here I've used SWIG for convenience only. The
 * 			mds_utils::python::Obj class does not impose you
 * 			this choice.
 */

%module obj_usage

// Include the following interface files for having the proper typemaps
%include "std_string.i"
%include "mds_utils/python/common.i"
%include "mds_utils/python/obj.i"

%header %{
#include <mds_utils/python/obj.hpp>
#include <mds_utils/python/conversion.hpp>
#include <iostream>

namespace mdspy = mds_utils::python;
%}

%feature("autodoc","3");

%inline %{

// Tests attribute retrieval, when the attribute is a double
void print_attr(mds_utils::python::Obj o,const std::string& name) {
	using namespace std;
	
	o.incref();
		
    if (!o.has_attr(name)) {
        cout << "The object has not the \"" << name << "\" attribute." << endl;
        return;
    }
	
	cout << "Attribute value: " << mdspy::get<double>(o.attr(name)) << endl;
	
	o.decref();
}


// Tests the set attribute
void set_attr(mds_utils::python::Obj o,const std::string& name,double val) {
    o.attr(name) = val;
}


// Tests the transfer method
PyObject* dup_obj(mds_utils::python::Obj o) {

	o.incref();

	PyObject *pret(o.transfer());
	
	return pret;
}


// Tests the operator () for callable objects
mds_utils::python::Obj test_call(mds_utils::python::Obj o) {
	
	mdspy::Obj
		out(o());
		
	return out;
}

// Tests the operator () on a callable attribute
mds_utils::python::Obj test_call_attr(mds_utils::python::Obj o,const std::string& name) {
		
	mdspy::Obj
		out(o.attr(name)());
		
	return out;
}


// Tests calling an object with positional arguments
mds_utils::python::Obj test_call_args(mds_utils::python::Obj o,mds_utils::python::Obj args) {
	
	mdspy::Obj
		out(o(args));
		
	return out;
}


// Tests calling an object with positional arguments and keyword arguments
mds_utils::python::Obj test_call_args_kw(mds_utils::python::Obj o,
	mds_utils::python::Obj args,
	mds_utils::python::Obj kw) {
	
	mdspy::Obj
		out(o(args,kw));
		
	return out;
}

%}
