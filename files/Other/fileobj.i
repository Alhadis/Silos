// mds_utils/python/fileobj.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%include "mds_utils/python/obj.i"

%header %{

#include <mds_utils/python/fileobj.hpp>

%}

%typemap(in) (mds_utils::python::FileObj) {
	try {
		$1 = $input;
		$1.incref();
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typemap(out) mds_utils::python::FileObj = mds_utils::python::Obj;

%typecheck(SWIG_TYPECHECK_POINTER) mds_utils::python::Sequence {
  $1 = PyFile_Check($input);
}
