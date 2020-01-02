// mds_utils/python/sequence.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%include "mds_utils/python/obj.i"

%header %{

#include <mds_utils/python/sequence.hpp>

%}

%typemap(in) (mds_utils::python::Sequence) {
	try {
		if (!PySequence_Check($input)) {
			throw std::invalid_argument("The sequence argument is not a sequence.");
		}
		$1 = $input;
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typemap(out) mds_utils::python::Sequence = mds_utils::python::Obj;

%typecheck(SWIG_TYPECHECK_POINTER) mds_utils::python::Sequence {
  $1 = PySequence_Check($input);
}

