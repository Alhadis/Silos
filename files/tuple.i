// mds_utils/python/tuple.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%include "mds_utils/python/obj.i"

%typemap(in) (mds_utils::python::Tuple) {
	try {
		if (!PyTuple_Check($input)) {
			throw std::invalid_argument("The tuple argument is not a tuple.");
		}
		$1 = $input;
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typemap(out) mds_utils::python::Tuple = mds_utils::python::Obj;

%typecheck(SWIG_TYPECHECK_POINTER) mds_utils::python::Sequence {
  $1 = PyTuple_Check($input);
}
