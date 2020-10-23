////////////////////////////////////////////////////////////////////////////////
// dmfi_mod_pcload - DM Friendly Initiative - On PC Loaded Script : Module Event
// Original Scripter:  Demetrious      Design: DMFI Design Team
//------------------------------------------------------------------------------
// Last Modified By:   Demetrious           12/6/6
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////

// This script is only included so that I can create an up to date erf for the 
// Listener package - it is purposefully excluded from the dmfi.erf

#include "dmfi_inc_initial"

void main()
{
	//SetLocalInt(GetEnteringObject(), DMFI_DM_STATE,1);  //QA Testing purposes only.
	DMFI_ClientEnter(GetEnteringObject());
}