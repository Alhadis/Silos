/******************************  Source Control Header ********************************\

    Description: Include to be used at the top of each replication trigger procedure.

******************************** $NoKeywords:  $ **************************************/

&if "{&_panaedra_msroot_msutil_logic_top_i_ptop_replicationtrigger_i}" = "" &then

routine-level on error undo, throw.

/* HQ Timestamps: Switch HqtActive to false before commit */
{panaedra/msroot/msutil/logic/sc_mshqtimestamp_active.i}
{panaedra/msroot/msutil/logic/sc_mshqtimestamp_pp.i}

/* Default of DisableReplForSomeDevelopers is now "false". Reason: since 2016Q4, all environments are _CLOUD_ replication enabled. */
&glob DisableReplForSomeDevelopers false

if (opsys = "win32")
  &if {&DisableReplForSomeDevelopers} = true &then
  /* Python support is not yet implemented in windows fully. For testing/debugging, allow non live procedures to proceed in this preprocessor mode. */
  and (not panaedra.msroot.msutil.logic.sc_environment:bLiveEnv)
  &endif
  then
  return.

&if {&DisableReplForSomeDevelopers} = true &then
/* Live environment: _TOOLING_ always active */
if panaedra.msroot.msutil.logic.sc_environment:bLiveEnv
  or
  /* Tst environment: replication active for automatic unit tests (no DevToken) */
  (panaedra.msroot.msutil.logic.sc_environment:cEnv = "tst" and trim(subst("&1 &2", os-getenv("DlcTest_"), os-getenv("test#"))," ?") = "") 
  or
  /* testT DevToken: _TOOLING_ always active (testT has own endpoint) */
  (subst("&1 &2", os-getenv("DlcTest_"), os-getenv("test#")) matches "*testT*")
  or
  /* testA DevToken: replication active for _PPL_UNDISCLOSED_, pub (testA uses no-devtoken endpoint) */
  (sc_environment:cEnv = "pub" and subst("&1 &2", os-getenv("DlcTest_"), os-getenv("test#")) matches "*testA*")
  then.   /* Do nothing -> Continue with replication trigger */
else
  return. /* Don't disturb other developers */
&endif

&endif

/* EOF : panaedra/msroot/msutil/logic/top_i/ptop_replicationtrigger.i */
