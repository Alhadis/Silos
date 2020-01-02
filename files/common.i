// mds_utils/python/common.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%include exception.i

%header %{

#include <mds_utils/python/exception.hpp>

%}

// Generic exception handler
%exception {
	try {
		$action
	} catch (std::exception& e) {
        SWIG_exception(SWIG_RuntimeError,e.what());
    }
}

// Exception handler specific for the __getitem__ method
%exception __getitem__ {
	try {
		$action
	} catch (mds_utils::python::index_error& e) {
		SWIG_exception(SWIG_IndexError,e.what());
	} catch (std::exception& e) {
        SWIG_exception(SWIG_RuntimeError,e.what());
    }
}


// Exception handler specific for the py_get_item method
%exception py_get_item {
	try {
		$action
	} catch (mds_utils::python::index_error& e) {
		SWIG_exception(SWIG_IndexError,e.what());
	} catch (std::exception& e) {
        SWIG_exception(SWIG_RuntimeError,e.what());
    }
}
