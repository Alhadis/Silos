/* -*- c++ -*- */

#define AIRSPY_API

%include "gnuradio.i"           // the common stuff

//load generated python docstrings
%include "airspy_swig_doc.i"

%{
#include "airspy/airspyhf.h"
%}

%include "airspy/airspyhf.h"
GR_SWIG_BLOCK_MAGIC2(airspy, airspyhf);
