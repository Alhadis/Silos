/* ----------------------------------------------------------------------------
  This file is part of the RealityGrid AVS/Express LB3D Module.
 
  (C) Copyright 2005, University of Manchester, United Kingdom,
  all rights reserved.
 
  This software was developed by the RealityGrid project
  (http://www.realitygrid.org), funded by the EPSRC under grants
  GR/R67699/01 and GR/R67699/02.
 
  LICENCE TERMS
 
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:
  1. Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
 
  THIS MATERIAL IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. THE ENTIRE RISK AS TO THE QUALITY
  AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE PROGRAM PROVE
  DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
  CORRECTION.
 
  Author........: Robert Haines
---------------------------------------------------------------------------- */

flibrary RealityGridLB3DMods <
   build_dir="iac_proj/reg_lb3d",
   out_hdr_file="lb3d_gen.hxx",
   out_src_file="lb3d_gen.cxx",
   cxx_hdr_files="../reg_steer/reg_gen.hxx",
   cxx_name="" > {

   // define the low-level mod
   module RealityGridLB3DReaderMod<
      src_file="RealityGridLB3DReaderMod.cxx",
      cxx_members="      void volumeOutput(double*, int);\n"
      > {
	 // methods
	 cxxmethod read(
	    inData+notify+read+req,
	    numSlices+read,
	    minLabel+write,
	    maxLabel+write,
	    outDims+write,
	    outData+write,
	    outShortData+write,
	    outByteData+write
	 );
	 cxxmethod readField(
	    inField+notify+read+req,
	    configuration+read+req,
	    minLabel+write,
	    maxLabel+write,
	    outDims+write,
	    outData+write,
	    outShortData+write,
	    outByteData+write
	 );
	 
	 // inputs
	 IAC_PROJ.RealityGrid.RealityGridMods.RealityGridSteeringParams &configuration<NEportLevels={2,0}>;
	 IAC_PROJ.RealityGrid.RealityGridMods.RealityGridDataSlice &inData<NEportLevels={2,0}>[];
	 Mesh_Struct+Node_Data &inField<NEportLevels={2,0}>;

	 // the number of data slices of data
	 int numSlices => array_size(inData);

	 // produce volume data output?
	 int volOutput;
	 double minLabel;
	 double maxLabel;

	 // outputs
	 int outDims<NEportLevels={0,2}>[3];
	 double outData<NEportLevels={0,2}>[];
	 short outShortData<NEportLevels={0,2}>[];
	 byte outByteData<NEportLevels={0,2}>[];
	 
   }; // RealityGridLB3DReaderMod
};
