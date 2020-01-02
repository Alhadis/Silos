// mds_utils/python/list.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%include "mds_utils/python/obj.i"

%header %{

#include <mds_utils/python/list.hpp>

%}

%typemap(in) (mds_utils::python::List) {
	try {
		if (!PyList_Check($input)) {
			throw std::invalid_argument("The list argument is not a list.");
		}
		$1 = $input;
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typemap(out) mds_utils::python::List = mds_utils::python::Obj;

%typecheck(SWIG_TYPECHECK_POINTER) mds_utils::python::Sequence {
  $1 = PyList_Check($input);
}

