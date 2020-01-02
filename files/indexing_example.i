// indexing_example.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../include -o indexing_example_wrap.cpp indexing_example.i
 *
 * 2. python setup.py build
 */

/**
 * \example	indexing_example.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::support_random_access and
 * mds_utils::python::support_random_getset_access usage.
 *
 * \remarks	Here I've used SWIG for convenience only. The
 * 			mds_utils::python::FileObj class does not impose you
 * 			this choice.
 */

%module indexing_example

%include "mds_utils/python/common.i"
%include "mds_utils/python/obj.i"

%header %{

#include "indexing_example.hpp"

namespace mdspy = mds_utils::python;

%}


class Dummy_Container {
	
public:
	
	Dummy_Container();
	
%extend {
	// The following methods are created as extensions
	
	mds_utils::python::Obj __getitem__(mds_utils::python::Obj idx) {
		return $self->py_get_item(idx);
	}
	
	void __setitem__(mds_utils::python::Obj idx,mds_utils::python::Obj val) {
		$self->py_set_item(idx,val);
	}
}

};
