// dict_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../include -o dict_usage_wrap.cpp dict_usage.i
 *
 * 2. python setup.py build
 */
 
/**
 * \example	dict_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::Dictionary usage.
 *
 * \remarks	Here I've used SWIG for convenience only. The
 * 			mds_utils::python::Dictionary class does not impose you
 * 			this choice.
 */

%module dict_usage

// Include the following interface files for having the proper typemaps
%include "std_string.i"
%include "mds_utils/python/common.i"
%include "mds_utils/python/list.i"
%include "mds_utils/python/dictionary.i"

%header %{
#include <mds_utils/python/conversion.hpp>
#include <mds_utils/python/dictionary.hpp>
#include <iostream>

namespace mdspy = mds_utils::python;
%}


%inline %{

// Tests the copy of the dictionary
mds_utils::python::Dictionary copy_dict(mds_utils::python::Dictionary d) {
	
	mdspy::Dictionary	out;
	
	out.copy(d);
	
	return out;
}

// Tests the clear method
void clear_dict(mds_utils::python::Dictionary d) {
	d.clear();
}

// Tests the contains method
bool dict_contains(mds_utils::python::Dictionary d,mds_utils::python::Obj key) {
	return d.contains(key);
}

// Tests the contains method, with integer key
bool dict_contains_int_key(mds_utils::python::Dictionary d,int key) {
	return d.contains(key);
}

// Tests the contains method, with string key
bool dict_contains_str_key(mds_utils::python::Dictionary d,std::string key) {
	return d.contains(key);
}

// Tests the set_item method
void dict_set_item(mds_utils::python::Dictionary d,mds_utils::python::Obj key,mds_utils::python::Obj val) {
	d.set_item(key,val);
}

// Tests the set_item method, with string key and integer value
void dict_set_item_str_int(mds_utils::python::Dictionary d,std::string key,int val) {
	d.set_item(key,val);
}

// Tests the del_item method
void dict_del_item(mds_utils::python::Dictionary d,mds_utils::python::Obj key) {
	d.del_item(key);
}


// Tests the get_item method
mds_utils::python::Obj dict_get_item(mds_utils::python::Dictionary d,mds_utils::python::Obj key) {
	return d.get_item(key);
}

// Tests the items method
mds_utils::python::List dict_items(mds_utils::python::Dictionary d) {
	return d.items();
}

// Tests the keys method
mds_utils::python::List dict_keys(mds_utils::python::Dictionary d) {
	return d.keys();
}

// Tests the values method
mds_utils::python::List dict_values(mds_utils::python::Dictionary d) {
	return d.values();
}

// Tests the len method
size_t dict_len(mds_utils::python::Dictionary d) {
	return d.len();
}


// Tests the update method
void dict_update(mds_utils::python::Dictionary a,mds_utils::python::Dictionary b) {
	a.update(b);
}


%}
