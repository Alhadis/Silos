// ublas.i
// 
// Copyright (c) 2014 - Michele De Stefano (micdestefano@users.sourceforge.net)
// 
// Distributed under the MIT License (See accompanying file LICENSE)

/*
 * Instructions for generating extension wrapper sources (issue the command
 * from the root directory of the Python package distribution, i.e. from the
 * "python" directory):
 *
 * swig -c++ -Wall -python -I../include -o mds_utils/ublas/ublas_wrap.cpp -outdir mds_utils/ublas mds_utils/ublas/ublas.i
 */

%module(package="mds_utils") ublas

%include <mds_utils/python/ublas/storage.i>
%include <mds_utils/python/ublas/vector.i>
%include <mds_utils/python/ublas/matrix.i>
%include <mds_utils/python/ublas/matrix_sparse.i>
%include <mds_utils/python/tuple.i>
%include <mds_utils/python/common.i>
%include <std_string.i>

%header %{
#include <boost/numeric/ublas/io.hpp>
#include <boost/numeric/ublas/symmetric.hpp>
#include <boost/numeric/ublas/banded.hpp>
#include <mds_utils/python/conversion.hpp>
#include <mds_utils/python/ublas/detail/common.hpp>
#include <mds_utils/python/numpy/array_iterator.hpp>
#include <iostream>
#include <sstream>
#include <algorithm>

namespace ublas_convert = boost::numeric::ublas;
%}

%feature("autodoc","3");

%feature("docstring") size1
"Returns the number of rows.";

%feature("docstring") size2
"Returns the number of columns.";

%feature("docstring") to_dense
"Converts the matrix into a dense NumPy array.";

namespace boost { namespace numeric { namespace ublas {

%feature("docstring") vector
"Boost uBLAS vector.

There are different vector types, depending on the data type they store.
Each vector type is denoted with the convention

vector_<type flag>

Documentation for valid type flags can be read issuing help(ublas).

Author:	Michele De Stefano.
Date:	03/07/2014";

template<class T>
class vector {

public:

%feature("docstring") vector
"Constructor.

The first form builds an empty vector.
The second one builds a vector with the specified size.";

	vector();
	
	vector(size_t size);
	
%feature("docstring") size "Returns the size of the vector.";
	size_t size();
	
%extend {
	
%feature("docstring") from_array "Fills the vector from a NumPy array o.";

	void from_array(mds_utils::python::Obj o) {
		*($self) = mds_utils::python::ublas::get< boost::numeric::ublas::vector<T> >(o);
	}
	
%feature("docstring") to_array
"Converts the vector into a NumPy array.
It returns the corresponding NumPy array.";

	ublas_convert::vector to_array() {
		return *($self);
	}

%feature("docstring") __getitem__
"Allows retrieving elements by indexing.
This also makes the object iterable."

	T __getitem__(size_t i) const {
		if (i >= $self->size()) {
			throw mds_utils::python::index_error("Index out of bounds");
		}
		return $self->data()[i];
	}
	
%feature("docstring") __setitem__
"Allows setting elements by indexing."

	void __setitem__(size_t i,T val) {
		if (i >= $self->size()) {
			throw mds_utils::python::index_error("Index out of bounds");
		}
		$self->data()[i] = val;
	}
	
	std::string __str__() const {
		using namespace std;
		
		ostringstream	oss;
		
		oss << *($self);
		
		return oss.str();
	}
	
}

};


%define VECTOR_SPEC_GEN(type,flag)

%template(vector_ ## flag) vector< type >;

%enddef

VECTOR_SPEC_GEN(char,c)
VECTOR_SPEC_GEN(unsigned char,uc)
VECTOR_SPEC_GEN(short,s)
VECTOR_SPEC_GEN(unsigned short,us)
VECTOR_SPEC_GEN(int,i)
VECTOR_SPEC_GEN(unsigned int,ui)
VECTOR_SPEC_GEN(long,l)
VECTOR_SPEC_GEN(unsigned long,ul)
VECTOR_SPEC_GEN(long long,ll)
VECTOR_SPEC_GEN(unsigned long long,ull)
VECTOR_SPEC_GEN(size_t,st)
VECTOR_SPEC_GEN(float,f)
VECTOR_SPEC_GEN(double,d)
VECTOR_SPEC_GEN(long double,ld)
VECTOR_SPEC_GEN(std::complex<float>,cf)
VECTOR_SPEC_GEN(std::complex<double>,cd)
VECTOR_SPEC_GEN(std::complex<long double>,cld)

%feature("docstring") matrix
"Boost uBLAS dense matrix.

Each matrix type is denoted with the convention

matrix_<type flag><storage flag>

Documentation for valid type and storage flags can be read issuing
help(ublas).

Author:	Michele De Stefano.
Date:	06/07/2014";

template<class T,class F = row_major>
class matrix {

public:

%feature("docstring") matrix
"Constructor.

The first form builds an empty matrix.
The second one builds a matrix with dimensions m x n.";

	matrix();
	
	matrix(size_t m,size_t n);

	size_t size1() const;
	
	size_t size2() const;
	
%extend {
	
%feature("docstring") from_array "Fills the matrix from a NumPy array o.";
	
	void from_array(mds_utils::python::Obj o) {
		*($self) = mds_utils::python::ublas::get< boost::numeric::ublas::matrix<T,F> >(o);
	}
	
%feature("docstring") to_array
"Converts the matrix into a NumPy array.
It returns the corresponding NumPy array.";
	
	ublas_convert::matrix to_array() {
		return *($self);
	}

%feature("docstring") __getitem__
"Allows retrieving elements by indexing with row-col indices i,j.
It also supports one dimensional indexing with a single index. In
this case, the matrix is scanned according to its ordering. This
method makes the matrix iterable.";
	
	T __getitem__(PyObject *o) const {
		
		using namespace mds_utils::python;
		
		size_t	i(0);
		
		if (PyInt_Check(o)) {
			
			i = get<size_t>(o);

			if (i >= $self->data().size()) {
				throw mds_utils::python::index_error("1D index out of bounds");
			}
			
			return $self->data()[i];
		}
		
		Tuple	tup_idx(o);
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		i = get<size_t>(tup_idx[0]);
				
		size_t	j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}
		
		return $self->operator()(i,j);
	}
	

%feature("docstring") __setitem__
"Allows setting elements by indexing with row-col indices i,j.
It also supports one dimensional indexing with a single index. In
this case, the matrix is scanned according to its ordering.";
	
	void __setitem__(PyObject *o,T val) {
		using namespace mds_utils::python;
		
		size_t	i(0);
		
		if (PyInt_Check(o)) {
			
			i = get<size_t>(o);

			if (i >= $self->data().size()) {
				throw mds_utils::python::index_error("1D index out of bounds");
			}
			
			$self->data()[i] = val;
			
			return;
		}
		
		Tuple	tup_idx(o);
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		i = get<size_t>(tup_idx[0]);

		size_t	j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}

		$self->operator()(i,j) = val;
	}
	
	std::string __str__() const {
		using namespace std;
		
		ostringstream	oss;
		
		oss << *($self);
		
		return oss.str();
	}	
}

};

%define MATRIX_SPEC_GEN(type,flag)

%template(matrix_ ## flag ## row) matrix< type >;
%template(matrix_ ## flag ## col) matrix< type,column_major >;

%enddef

MATRIX_SPEC_GEN(char,c)
MATRIX_SPEC_GEN(unsigned char,uc)
MATRIX_SPEC_GEN(short,s)
MATRIX_SPEC_GEN(unsigned short,us)
MATRIX_SPEC_GEN(int,i)
MATRIX_SPEC_GEN(unsigned int,ui)
MATRIX_SPEC_GEN(long,l)
MATRIX_SPEC_GEN(unsigned long,ul)
MATRIX_SPEC_GEN(long long,ll)
MATRIX_SPEC_GEN(unsigned long long,ull)
MATRIX_SPEC_GEN(size_t,st)
MATRIX_SPEC_GEN(float,f)
MATRIX_SPEC_GEN(double,d)
MATRIX_SPEC_GEN(long double,ld)
MATRIX_SPEC_GEN(std::complex<float>,cf)
MATRIX_SPEC_GEN(std::complex<double>,cd)
MATRIX_SPEC_GEN(std::complex<long double>,cld)



%feature("docstring") compressed_matrix
"Boost uBLAS compressed sparse matrix.

Each matrix type is denoted with the convention

compressed_matrix_<type flag><storage flag>

Documentation for valid type and storage flags can be read issuing
help(ublas).

Author:	Michele De Stefano.
Date:	03/07/2014";

template<class T,class F = row_major>

class compressed_matrix {

public:

%feature("docstring") compressed_matrix
"Constructor.

The first form builds an empty matrix.
The second one builds a matrix with dimensions m x n.";

	compressed_matrix();
	
	compressed_matrix(size_t m,size_t n);

	size_t size1() const;
	
	size_t size2() const;
	
%extend {
	
%feature("docstring") from_sparse_mtx
"Fills the matrix from a SciPy compressed matrix.
The SciPy matrix must be scipy.sparse.csr_matrix if the uBLAS matrix
uses the row_major storage. Otherwise it has to be a
scipy.sparse.csc_matrix.";

	void from_sparse_mtx(mds_utils::python::Obj o) {
		*($self) = mds_utils::python::ublas::get< boost::numeric::ublas::compressed_matrix<T,F> >(o);
	}
		
%feature("docstring") to_sparse_mtx
"Converts the matrix into a SciPy compressed matrix.
The matrix is scipy.sparse.csr_matrix if the uBLAS matrix uses the
row_major storage. Otherwise it is a scipy.sparse.csc_matrix.";

	ublas_convert::compressed_matrix to_sparse_mtx() {
		return *($self);
	}
	

	ublas_convert::matrix<T,F> to_dense() {
		return *($self);
	}


	std::string __str__() const {
		using namespace std;
		
		ostringstream	oss;
		
		oss << *($self);
		
		return oss.str();
	}
	
%feature("docstring") __getitem__
"Allows retrieving elements by indexing with row-col indices i,j.
It does not support one dimensional indexing with a single index.";

	T __getitem__(mds_utils::python::Tuple tup_idx) const {
		
		using namespace mds_utils::python;
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		size_t	i(get<size_t>(tup_idx[0])),
				j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}
		
		return $self->operator()(i,j);
	}
	

%feature("docstring") __setitem__
"Allows setting elements by indexing with row-col indices i,j.
It does not support one dimensional indexing with a single index.";

	void __setitem__(mds_utils::python::Tuple tup_idx,T val) {
		using namespace mds_utils::python;
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		size_t	i(get<size_t>(tup_idx[0])),
				j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}

		$self->operator()(i,j) = val;
	}
}

};

%define COMPRESSED_MATRIX_SPEC_GEN(type,flag)

%template(compressed_matrix_ ## flag ## row) compressed_matrix< type >;
%template(compressed_matrix_ ## flag ## col) compressed_matrix< type,column_major >;

%enddef

COMPRESSED_MATRIX_SPEC_GEN(char,c)
COMPRESSED_MATRIX_SPEC_GEN(unsigned char,uc)
COMPRESSED_MATRIX_SPEC_GEN(short,s)
COMPRESSED_MATRIX_SPEC_GEN(unsigned short,us)
COMPRESSED_MATRIX_SPEC_GEN(int,i)
COMPRESSED_MATRIX_SPEC_GEN(unsigned int,ui)
COMPRESSED_MATRIX_SPEC_GEN(long,l)
COMPRESSED_MATRIX_SPEC_GEN(unsigned long,ul)
COMPRESSED_MATRIX_SPEC_GEN(long long,ll)
COMPRESSED_MATRIX_SPEC_GEN(unsigned long long,ull)
COMPRESSED_MATRIX_SPEC_GEN(size_t,st)
COMPRESSED_MATRIX_SPEC_GEN(float,f)
COMPRESSED_MATRIX_SPEC_GEN(double,d)
COMPRESSED_MATRIX_SPEC_GEN(long double,ld)
COMPRESSED_MATRIX_SPEC_GEN(std::complex<float>,cf)
COMPRESSED_MATRIX_SPEC_GEN(std::complex<double>,cd)
COMPRESSED_MATRIX_SPEC_GEN(std::complex<long double>,cld)


struct lower {};
struct upper {};

%feature("docstring") symmetric_matrix
"Wraps a uBLAS symmetric matrix.

The naming scheme is

    symmetric_matrix_<l/u>_<type flag><storage flag>
    
where
    - l/u stand for lower/upper (specify only one)
    - type flag is one of the valid data type flags (see help(ublas))
    - storage flag is one of the valid storage flags (see help(ublas))

Author: Michele De Stefano
Date:   04/07/2014";

template<class T,class F1 = lower,class F2 = row_major>
class symmetric_matrix {

public:

%feature("docstring") symmetric_matrix
"Constructor.

The first form builds an empty matrix.
The second one builds a matrix with dimensions n x n.";

	symmetric_matrix();
	
	symmetric_matrix(size_t n);

	size_t size1() const;
	
	size_t size2() const;
	
%extend {
	
%feature("docstring") from_array
"Fills the matrix from a NumPy array o. The array must have a size
less or equal to the number of elements in the stored upper or lower
triangle. It is not necessary for the array to be 1D. Symmetric matrix 
elements and array elements are scanned according to the storage order
of the symmetric matrix.";
	
	void from_array(mds_utils::python::Obj o) {
		using namespace std;
		using namespace mds_utils::python::numpy;
		using namespace mds_utils::python::ublas;
		
		using mds_utils::python::ublas::detail::ublas_to_npy_storage;
		
		PyArrayObject*
			parr(reinterpret_cast<PyArrayObject*>(
				static_cast<PyObject*>(o)));
				
		size_t	arr_size(static_cast<size_t>(PyArray_SIZE(parr)));
		
		if (arr_size > $self->data().size()) {
			throw invalid_argument("The NumPy array is too large.");
		}

		NDArrayIterator<T,
			ublas_to_npy_storage<F2>::tag,NPY_ITER_READONLY>
			
			arr_it(parr),
			arr_it_end(arr_it,true);

		copy(arr_it,arr_it_end,$self->data().begin());
	}
	
%feature("docstring") to_array
"Converts the symmetric matrix into a 1D NumPy array.
The elements are scanned according to the storage order.";
	
	PyObject* to_array() {

		using namespace std;
		using namespace mds_utils::python::numpy;
		using namespace mds_utils::python::ublas;
		
		int
			nd(1),
			flags(0);
			
		npy_intp
			dims[] = {
				boost::numeric_cast<npy_intp>($self->data().size())
			};
		
		int	dtype(numpy_dtype_traits<T>::typenum);
		
		PyObject *pout(PyArray_New(&PyArray_Type,nd,dims,dtype,
			NULL,NULL,0,flags,NULL));

		NDArrayIterator<T,c_storage,NPY_ITER_WRITEONLY>
			arr_it(reinterpret_cast<PyArrayObject*>(pout));
			
		copy($self->data().begin(),$self->data().end(),arr_it);
		
		return pout;
	}
	
	ublas_convert::matrix<T,F2> to_dense() {
		return *($self);
	}

%feature("docstring") __getitem__
"Allows retrieving elements by indexing with row-col indices i,j.
It also supports one dimensional indexing with a single index. In
this case, the matrix is scanned in the stored triangular parto only,
and according to its ordering. This method makes the matrix iterable.";
	
	T __getitem__(PyObject *o) const {
		
		using namespace mds_utils::python;
		
		size_t	i(0);
		
		if (PyInt_Check(o)) {
			
			i = get<size_t>(o);

			if (i >= $self->data().size()) {
				throw mds_utils::python::index_error("1D index out of bounds");
			}
			
			return $self->data()[i];
		}
		
		Tuple	tup_idx(o);
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		i = get<size_t>(tup_idx[0]);
				
		size_t	j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}
		
		return $self->operator()(i,j);
	}
	

%feature("docstring") __setitem__
"Allows setting elements by indexing with row-col indices i,j.
It also supports one dimensional indexing with a single index. In
this case, the matrix is scanned in the stored triangular part only, and
according to its ordering.";
	
	void __setitem__(PyObject *o,T val) {
		using namespace mds_utils::python;
		
		size_t	i(0);
		
		if (PyInt_Check(o)) {
			
			i = get<size_t>(o);

			if (i >= $self->data().size()) {
				throw mds_utils::python::index_error("1D index out of bounds");
			}
			
			$self->data()[i] = val;
			
			return;
		}
		
		Tuple	tup_idx(o);
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		i = get<size_t>(tup_idx[0]);

		size_t	j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}

		$self->operator()(i,j) = val;
	}
	
	std::string __str__() const {
		using namespace std;
		
		ostringstream	oss;
		
		oss << *($self);
		
		return oss.str();
	}	
}

};


%define SYMM_MATRIX_SPEC_GEN(type,flag)

%template(symmetric_matrix_l_ ## flag ## row) symmetric_matrix< type,lower,row_major >;
%template(symmetric_matrix_u_ ## flag ## row) symmetric_matrix< type,upper,row_major >;
%template(symmetric_matrix_l_ ## flag ## col) symmetric_matrix< type,lower,column_major >;
%template(symmetric_matrix_u_ ## flag ## col) symmetric_matrix< type,upper,column_major >;

%enddef

SYMM_MATRIX_SPEC_GEN(char,c)
SYMM_MATRIX_SPEC_GEN(unsigned char,uc)
SYMM_MATRIX_SPEC_GEN(short,s)
SYMM_MATRIX_SPEC_GEN(unsigned short,us)
SYMM_MATRIX_SPEC_GEN(int,i)
SYMM_MATRIX_SPEC_GEN(unsigned int,ui)
SYMM_MATRIX_SPEC_GEN(long,l)
SYMM_MATRIX_SPEC_GEN(unsigned long,ul)
SYMM_MATRIX_SPEC_GEN(long long,ll)
SYMM_MATRIX_SPEC_GEN(unsigned long long,ull)
SYMM_MATRIX_SPEC_GEN(size_t,st)
SYMM_MATRIX_SPEC_GEN(float,f)
SYMM_MATRIX_SPEC_GEN(double,d)
SYMM_MATRIX_SPEC_GEN(long double,ld)
SYMM_MATRIX_SPEC_GEN(std::complex<float>,cf)
SYMM_MATRIX_SPEC_GEN(std::complex<double>,cd)
SYMM_MATRIX_SPEC_GEN(std::complex<long double>,cld)


%feature("docstring") banded_matrix
"Wraps a uBLAS banded matrix.

The naming scheme is

    banded_matrix_<type flag><storage flag>
    
where
    - type flag is one of the valid data type flags (see help(ublas))
    - storage flag is one of the valid storage flags (see help(ublas))

Author: Michele De Stefano
Date:   06/07/2014";

template<class T,class F = row_major>
class banded_matrix {

public:

%feature("docstring") banded_matrix
"Constructor.

The first form builds an empty banded matrix.
The second one builds a banded matrix with dimensions m x n that holds
(lower + 1 + upper) diagonals around the main diagonal";

	banded_matrix();
	
	banded_matrix(size_t m,size_t n,size_t lower = 0,size_t upper = 0);

	size_t size1() const;
	
	size_t size2() const;
	
%feature("docstring") lower
"Returns the number of diagonals below the main diagonal.";

	size_t lower () const;
	
%feature("docstring") lower
"Returns the number of diagonals above the main diagonal.";

	size_t upper () const;
	
%extend {
		
	ublas_convert::matrix<T,F> to_dense() {
		return *($self);
	}

%feature("docstring") __getitem__
"Allows retrieving elements by indexing with row-col indices i,j.
It does not support one dimensional indexing with a single index.";

	T __getitem__(mds_utils::python::Tuple tup_idx) const {
		
		using namespace mds_utils::python;
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		size_t	i(get<size_t>(tup_idx[0])),
				j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}
		
		return $self->operator()(i,j);
	}
	

%feature("docstring") __setitem__
"Allows setting elements by indexing with row-col indices i,j.
It does not support one dimensional indexing with a single index.";

	void __setitem__(mds_utils::python::Tuple tup_idx,T val) {
		using namespace mds_utils::python;
		
		if (tup_idx.len() != 2) {
			throw std::invalid_argument("Wrong number of indices");
		}
	
		size_t	i(get<size_t>(tup_idx[0])),
				j(get<size_t>(tup_idx[1]));
			
		if (i >= $self->size1()) {
			throw mds_utils::python::index_error("Row index out of bounds");
		}
		
		if (j >= $self->size2()) {
			throw mds_utils::python::index_error("Column index out of bounds");
		}

		$self->operator()(i,j) = val;
	}
	
	std::string __str__() const {
		using namespace std;
		
		ostringstream	oss;
		
		oss << *($self);
		
		return oss.str();
	}	
}

};


%define BANDED_MATRIX_SPEC_GEN(type,flag)

%template(banded_matrix_ ## flag ## row) banded_matrix< type >;
%template(banded_matrix_ ## flag ## col) banded_matrix< type,column_major >;

%enddef

BANDED_MATRIX_SPEC_GEN(char,c)
BANDED_MATRIX_SPEC_GEN(unsigned char,uc)
BANDED_MATRIX_SPEC_GEN(short,s)
BANDED_MATRIX_SPEC_GEN(unsigned short,us)
BANDED_MATRIX_SPEC_GEN(int,i)
BANDED_MATRIX_SPEC_GEN(unsigned int,ui)
BANDED_MATRIX_SPEC_GEN(long,l)
BANDED_MATRIX_SPEC_GEN(unsigned long,ul)
BANDED_MATRIX_SPEC_GEN(long long,ll)
BANDED_MATRIX_SPEC_GEN(unsigned long long,ull)
BANDED_MATRIX_SPEC_GEN(size_t,st)
BANDED_MATRIX_SPEC_GEN(float,f)
BANDED_MATRIX_SPEC_GEN(double,d)
BANDED_MATRIX_SPEC_GEN(long double,ld)
BANDED_MATRIX_SPEC_GEN(std::complex<float>,cf)
BANDED_MATRIX_SPEC_GEN(std::complex<double>,cd)
BANDED_MATRIX_SPEC_GEN(std::complex<long double>,cld)

}}}



%init %{
	import_array();
%}
