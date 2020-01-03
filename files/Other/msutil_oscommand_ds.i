/******************************  Dvcs_ Header ********************************\
       Filename: $Archive:  $ 
        Version: $Revision:  $ 
     Programmer: $Author: $ 
   Date Checkin: $Date:  $ 
  Date Modified: $Modtime:  $ 

    Description: dsMsOsCommand

\**************************** End of Dvcs_ Header ****************************/
&if "{&dvcs__panaedra_msroot_msutil_logic_ds_msutil_oscommand_ds_i}" = "" &then
&glob dvcs__panaedra_msroot_msutil_logic_ds_msutil_oscommand_ds_i yes
&glob sourcecontrolversions {&sourcecontrolversions} | panaedra_msroot_msutil_logic_ds_msutil_oscommand_ds_i $Revision: 1 $
&if '{&class}' = '' &then
procedure dvcs__panaedra_msroot_msutil_logic_ds_msutil_oscommand_ds_i: return "$Revision: 1 $". end.
&endif
/******************************* $NoKeywords:  $ *****************************/

&endif /* {&dvcs__panaedra_msroot_msutil_logic_ds_msutil_oscommand_ds_i} */

{panaedra/msroot/msutil/logic/tt/msutil_oscommanddef_tt.i {&*}}

define {&protected} {&static} dataset dsMsOsCommand for ttMsOsCommandDef.

/* EOF : panaedra/msroot/msutil/logic/ds/msutil_oscommand_ds.i */
