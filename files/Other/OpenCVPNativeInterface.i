%module opencvp
%include "typemaps.i"
%include "std_string.i"
%include "std_vector.i"
%include "boost_shared_ptr.i"
%include "arrays_java.i"
%include "various.i"

%apply signed char[] { signed char* };

%{
#include "InputPort.h"
#include "ImageInputPort.h"
#include "OutputPort.h"
#include "ImageOutputPort.h"
#include "Property.h"
#include "Container.h"
#include "ExecutionModel.h"
#include "FilterLibrary.h"
#include "FilterChain.h"
#include "Filter.h"
%}

namespace std {
    %template(StringVector) vector<string>;
    %template(FilterLibraryVector) vector<FilterLibrary*>;
    %template(InputPortVector) vector<InputPort*>;
    %template(OutputPortVector) vector<OutputPort*>;
    %template(PropertyVector) vector<Property*>;
}

%shared_ptr(FilterChain)

%include "InputPort.h"
%include "ImageInputPort.h"
%include "OutputPort.h"
%include "ImageOutputPort.h"
%include "Property.h"
%include "Container.h"
%include "ExecutionModel.h"
%include "FilterLibrary.h"
%include "FilterChain.h"
%include "Filter.h"

