%import "stl.i"
%import "std_string.i"
%import "std_pair.i"
%import "std_map.i"
%import "std_vector.i"
%import "exception.i"
%import "std_except.i"

%exception {
	try {
		$function
	} catch(std::runtime_error e) {
		SWIG_exception(SWIG_RuntimeError, e.what());
	}
}

namespace std {
  %feature("novaluewrapper") unique_ptr;
  template <typename Type>
  struct unique_ptr {
     typedef Type* pointer;

     explicit unique_ptr( pointer Ptr );
     unique_ptr (unique_ptr&& Right);
     template<class Type2, Class Del2> unique_ptr( unique_ptr<Type2, Del2>&& Right );
     unique_ptr( const unique_ptr& Right) = delete;


     pointer operator-> () const;
     pointer release ();
     void reset (pointer __p=pointer());
     void swap (unique_ptr &__u);
     pointer get () const;
     operator bool () const;

     ~unique_ptr();
  };
}

%define wrap_unique_ptr(Name, Type)
  %template(Name) std::unique_ptr<Type>;

  %typemap(out) std::unique_ptr<Type> (void* temp) %{
    temp = $1.release();
    $result = SWIG_NewPointerObj(temp, $descriptor(Type*), SWIG_POINTER_OWN);
  %}

%enddef

wrap_unique_ptr(AccessibleRef, aal::Accessible);

%template(AccessibleList) std::vector<aal::AccessibleRef>;

%typemap(out) aal::AccessibleList {
  int length = $1.size();
  v8::Local<v8::Array> array = v8::Array::New(v8::Isolate::GetCurrent(), length);

  for (int i = 0; i < length; i++)
  {
    array->Set(i, SWIG_NewPointerObj($1.at(i).release(), $descriptor(aal::Accessible*), 0 |  0 ));
  }

  $result = array;
}


// SWIG_as_voidptr

/*
%typemap(in, numinputs=0) bool (std::string temp) {
  #if $symname == Accessible_getBounds
    $1 = &temp;
  #endif
}

%typemap(argout) std::string const& input  {
  #if $symname == Accessible_typeString
    $result = SWIG_From_std_string(*$1);
  #endif
}

%typemap(freearg) std::string const& input  {
  #if $symname == Accessible_typeString

  #endif
}
*/
