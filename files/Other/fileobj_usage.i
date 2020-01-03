// fileobj_usage.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating and building the extension:
 *
 * 1. swig -c++ -Wall -python -I../../../include -o fileobj_usage_wrap.cpp fileobj_usage.i
 *
 * 2. python setup.py build
 */

/**
 * \example	fileobj_usage.i
 * 
 * A simple SWIG interface for a Python extension module that shows the
 * mds_utils::python::FileObj usage.
 *
 * \remarks	Here I've used SWIG for convenience only. The
 * 			mds_utils::python::FileObj class does not impose you
 * 			this choice.
 */

%module fileobj_usage

// Include the following interface files for having the proper typemaps
%include "mds_utils/python/fileobj.i"

%header %{
#include <mds_utils/python/conversion.hpp>
#include <mds_utils/python/fileobj.hpp>
#include <iostream>

namespace mdspy = mds_utils::python;
%}


%inline %{

double read_double(mds_utils::python::FileObj fobj) {

	using namespace std;

	istream				&ifs(fobj);
	
	double				val;
	
	ifs.read(reinterpret_cast<char*>(&val),sizeof(double));

	return val;
}



void write_double(mds_utils::python::FileObj fobj,double val) {

	using namespace std;

	ostream				&ofs(fobj);
	
	ofs.write(reinterpret_cast<char*>(const_cast<double*>(&val)),sizeof(double));
}

%}
