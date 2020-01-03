// mds_utils/python/obj.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

%typemap(in) (mds_utils::python::Obj) {
	try {
		$1 = $input;
	} catch (std::exception& e) {
		PyErr_SetString(PyExc_RuntimeError,e.what());
        SWIG_fail;
	}
}

%typemap(out) mds_utils::python::Obj {
	$result = $1.transfer();
}

%typecheck(SWIG_TYPECHECK_POINTER) mds_utils::python::Obj {
  $1 = 1;
}
