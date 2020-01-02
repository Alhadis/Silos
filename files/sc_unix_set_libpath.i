/****************************** Source Header ********************************\

    Description: Set the LIBPATH environment variable. 
                 It's reset on AIX because of the setuid flag 
                 on "_progres" (and appserver/other binaries)
                 
                 Needed for "external" procedures that reference shared objects with dependencies.

******************************** $NoKeywords:  $ *****************************/

&if opsys = "unix" &then

/* Note: On 2013 12 23, openssl and then python 2.7.6 (with modified Modules/Setup->SSL) 
         with gcc on AIX x64 was completely rebuilt with -blibpath ldflags (see _DOC_). 
         After this, setting LIBPATH is no longer necessary.
 
** if length(os-getenv("LIBPATH")) > 0 then.
** else sc_unix:SetEnvironmentValue("LIBPATH","/opt/freeware/lib64:/opt/freeware/lib:/usr/lib").
*/

&endif

/* EOF : panaedra/msroot/msutil/logic/sc_unix_set_libpath.i */
