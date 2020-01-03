/* -*- c++ -*- */

#define PHYLAYER_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "phylayer_swig_doc.i"

%{
#include "phylayer/phy_transmitter.h"
#include "phylayer/phy_receiver.h"
#include "phylayer/oncemsg.h"
%}


%include "phylayer/phy_transmitter.h"
GR_SWIG_BLOCK_MAGIC2(phylayer, phy_transmitter);
%include "phylayer/phy_receiver.h"
GR_SWIG_BLOCK_MAGIC2(phylayer, phy_receiver);
%include "phylayer/oncemsg.h"
GR_SWIG_BLOCK_MAGIC2(phylayer, oncemsg);
